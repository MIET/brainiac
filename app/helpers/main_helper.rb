module MainHelper
  def check_user
    if cookies.signed[:user_id]
      @current_user = User.find_by(:user_id, cookies.signed[:user_id])
      if params[:viewer_id]
        if params[:viewer_id].to_i == User.find(cookies.signed[:user_id])[:n_vk_id]
          return @authorized = true
        else
          cookies.signed[:user_id] = nil
          return @reload = true
        end
      else

        @authorized ||= true
      end
    elsif params[:viewer_id]

      if valid_user_info?
        user = User.find_by(:n_vk_id, (params[:viewer_id]))

        unless user
          user = User.new(params)
          user.save
        end

        @current_user = user

        cookies.signed[:user_id] = user[:user_id]
        @authorized = true
      else
        @authorized = false
      end
    else
      @authorized = false
    end
  end

  def valid_user_info?
    auth_parameters = Parameter.filter.split(',').join('|')
    auth_regex = Regexp.new(auth_parameters)
    university = JSON.parse(params['api_result'])['response'].first['university_name']
    university = university[auth_regex] if university
    schools = JSON.parse(params['api_result'])['response'].first['schools']
    school = schools.find{|school| school['name'][auth_regex]} if schools.any?
    !!(school || university)
  end
end
