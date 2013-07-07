class QuestionsController < ApplicationController
  def index
    @question = Question.current.first
    #TODO Проверка второго ответа должна быть здесь
    if @question.nil?
      render 'questions/no_questions'
    else
      render 'questions/show'
    end
  end
end
