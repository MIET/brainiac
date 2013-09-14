module Admin
  class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def edit
      @user = User.find(params[:id])
      @answers = @user.answers
    end
  end
end