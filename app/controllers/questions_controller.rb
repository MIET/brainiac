class QuestionsController < ApplicationController
  def index
    @question = Question.current

    if @question.nil?
      render :no_questions
    else
      if Answer.find_by_n_user_id(cookies.signed[:n_user_id]).nil?
        render :show
      else
        render :accepted
      end
    end
  end
end
