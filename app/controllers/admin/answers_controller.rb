module Admin
  class AnswersController < ApplicationController
    include AdminHelper
    before_filter :require_auth
    skip_before_filter  :verify_authenticity_token
    def edit
      @answer = Answer.find(params[:id])
    end

    def update
      @answer = Answer.find(params[:id])
      @answer[:vc_answer] = params[:vc_answer]
      @answer[:d_time] = params[:d_time].to_datetime
      @answer[:n_scores] = params[:n_scores]
      @answer.save
      @answer.user.refresh_stats
      redirect_to '/admin/users'
    end

    def index
      @users = User.answered_last

      render 'admin/users/index'
    end
  end
end