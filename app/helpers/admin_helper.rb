module AdminHelper
  def require_auth
    @admin = @current_user && @current_user.admin?

    redirect_to '/' unless @admin
  end
end
