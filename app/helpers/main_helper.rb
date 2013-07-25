module MainHelper
  def check_user
    if session.empty?
      return @reload = true
    end

    if session[:n_user_id]
      @current_user = User.find_by_n_user_id session[:n_user_id]
      if params[:viewer_id]
        if params[:viewer_id].to_i==User.find(session[:n_user_id])[:n_vk_id]
          return @authorized = true
        else
          session[:n_user_id] = nil unless params[:viewer_id].to_i==User.find(session[:n_user_id])[:n_vk_id]
          return @reload = true
        end
      else

        @authorized ||= true
      end
    elsif params[:viewer_id]

      if valid_user_info?
        user = User.find_by_n_vk_id(params[:viewer_id])

        unless user
          user = User.new(params)
          user.save
        end

        @current_user = user

        current_session = Session.find_by_vc_session_key(session[:session_id])

        if !current_session && session[:session_id]
          current_session = Session.new(vc_session_key: session[:session_id],n_user_id: user.id,vc_access_token: params[:access_token], d_time_start: Time.now)
          current_session.save
        end

        session[:n_user_id] = user[:n_user_id]
        @authorized = true
      else
        @authorized = false
      end
    else
      @authorized = false
    end
  end

  def valid_user_info?
    JSON.parse(params['api_result'])['response'].first['university_name'][/МИЭТ/] #TODO Переделать на использование параметров
  end
end
