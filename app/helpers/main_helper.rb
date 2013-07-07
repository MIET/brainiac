module MainHelper
  def check_user
    if params[:viewer_id]
      @user = User.find_by_n_vk_id(params[:viewer_id])

      unless @user
        @user = User.new(params)
        @user.save
      end
    end
  end

  def check_access

  end
end
