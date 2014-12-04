class QuestionsController < ApplicationController
  def index
    @question = Question.current

    if @question
      if @current_user.has_no_current_answer?
        render :show
      else
        render 'answers/accepted'
      end
    else
      render :no_questions
    end
  end
end
