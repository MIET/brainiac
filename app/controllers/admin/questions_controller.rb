module Admin
  class QuestionsController < ApplicationController
    def index
      @questions = Question.all
    end

    def new
      @question = Question.new
      @steps    = Step.all
      render :edit
    end

    def edit
      @question = Question.find(params[:id])
      @price = @question.price
      @steps = Step.all
    end

    def create
      step = Step.find_by_n_step_number(params[:step_number])
      @question = Question.new(n_step_id: step[:n_step_id],
                               n_step_number: params[:step_number],
                               n_number: params[:question_number],
                               vc_text: params[:question_text],
                               vc_type: "text",
                               d_time_start: params[:d_begin],
                               d_time_stop: params[:d_end])

      @question.save
      @true_answer = TrueAnswer.new(n_question_id: @question[:n_question_id],
                                    vc_true_answer: params[:answer]).save
      @price       = Price.new(n_question_id: @question[:n_question_id],
                               n_bonus_count: params[:bonus_count],
                               n_bonus_price: params[:bonus_price],
                               n_normal_price: params[:normal_price]).save
      @questions = Question.all

      render :index
    end

    def update
      @question = Question.find(params[:id])
      @question.renew_attributes(params).save

      @questions = Question.all

      render :index
    end

    def destroy
      @question = Question.find(params[:id])
      @question.answers.each(&:destroy)
      @question.price.destroy
      @question.true_answer.destroy
      @question.destroy

      @questions = Question.all

      render :index
    end

    def show
      @preview = true
      @question = Question.find(params[:id])
    end
  end
end