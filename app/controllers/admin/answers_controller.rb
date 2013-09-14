module Admin
  class AnswersController < ApplicationController
    def edit
      @answer = Answer.find(params[:id])
    end

    def update
      @answer = Answer.find(params[:id])
      @answer[:vc_answer] = params[:vc_answer]
      @answer[:d_time] = params[:d_time].to_datetime
      @answer[:n_scores] = params[:n_scores]
      @answer.save
      redirect_to '/admin/users'
    end
  end
end