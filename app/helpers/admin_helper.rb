module AdminHelper
  def require_auth
    if @current_user && @current_user.admin?
      @admin = true
    else
      @admin = false
    end

    redirect_to '/' unless @admin
  end
end
