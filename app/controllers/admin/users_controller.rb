module Admin
  class UsersController < ApplicationController
    include AdminHelper
    before_filter :require_auth
    skip_before_filter  :verify_authenticity_token
    def index
      @users = User.all.order('n_total_score desc')
    end

    def edit
      @user = User.find(params[:id])
      @answers = @user.answers
    end
  end
end