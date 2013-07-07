module Admin
  class UsersController < ApplicationController
    def index
      @users = User.all.order('n_total_score desc')
    end

    def edit
      @user = User.find(params[:id])
      @answers = @user.answers
    end
  end
end