module MainHelper
  def check_user
    if cookies.signed[:n_user_id]
      @current_user = User.find_by_n_user_id cookies.signed[:n_user_id]
      if params[:viewer_id]
        if params[:viewer_id].to_i==User.find(cookies.signed[:n_user_id])[:n_vk_id]
          return @authorized = true
        else
          cookies.signed[:n_user_id] = nil unless params[:viewer_id].to_i==User.find(cookies.signed[:n_user_id])[:n_vk_id]
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

        #current_cookies.signed = cookies.signed.find_by_vc_cookies.signed_key(cookies.signed[:cookies.signed_id])

        #if !current_cookies.signed && cookies.signed[:cookies.signed_id]
        #  current_cookies.signed = cookies.signed.new(vc_cookies.signed_key: cookies.signed[:cookies.signed_id],n_user_id: user.id,vc_access_token: params[:access_token], d_time_start: Time.now)
        #  current_cookies.signed.save
        #end

        cookies.signed[:n_user_id] = user[:n_user_id]
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
