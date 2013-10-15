module Admin
  class UsersController < ApplicationController
    include AdminHelper
    before_filter :require_auth
    skip_before_filter  :verify_authenticity_token
    def index
      @users = User.all
    end

    def edit
      @user = User.find(params[:id])
      @answers = Rails.cache.fetch(params[:id], expires_in: 2.hours ) do
        Rails.logger.info('Get from base')
        @user.answers
      end
    end
  end
end