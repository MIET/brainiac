class Answer < ActiveRecord::Base
  self.primary_key = "n_answer_id"

  belongs_to :user,
             foreign_key: 'n_user_id'

  def initialize(params)
    super()
    @question = Question.current
    @price = @question.price
    @true_answer = @question.true_answer
    self[:vc_answer] = params[:answer]
    self[:n_question_id] = @question.id
    if params[:answer] == @true_answer[:vc_answer]
      if @price[:n_bonus_count] < @question.answers.where(vc_answer: @true_answer[:vc_true_answer]).count
        self[:n_scores] = @price[:n_bonus_price]
      else
        self[:n_scores] = @price[:n_normal_price]
      end
    else
      self[:n_scores] = 0
    end
  end
end
