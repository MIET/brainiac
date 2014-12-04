class AnswersController < ApplicationController
  include MainHelper

  before_action :check_user
  skip_before_filter  :verify_authenticity_token

  def index
    @answers = Answer.all
  end

  def create
    if @current_user.has_no_current_answer?
      @answer = Answer.accept(params.require(:answer).permit(:vc_answer).merge(user_id: cookies.signed[:user_id]))
      @answer.save
      @answer.user.refresh_stats
    end

    render :accepted
  end
end
