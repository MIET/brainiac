class QuestionsController < ApplicationController
  def index
    @question = Question.current

    if @question.nil?
      render :no_questions
    else
      if @current_user.has_no_current_answer?
        render :show
      else
        render 'answers/accepted'
      end
    end
  end
end
