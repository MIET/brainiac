class Answer < ActiveRecord::Base
  self.primary_key = 'answer_id'

  belongs_to :user,
             foreign_key: :user_id

  belongs_to :question,
             foreign_key: :question_id

  delegate :price, to: :question

  def self.accept(attributes)
    @question = Question.current

    @answer = @question.answers.build(vc_answer: attributes[:vc_answer], user_id: attributes[:user_id], d_time: Time.now)

    @answer.n_scores = @answer.calc_scores
  end

  def calc_scores
    is_correct? ? correct_answer_cost : 0
  end

  def correct_answer_cost
    need_bonus? ? price.n_bonus_price : price.n_normal_price
  end

  def need_bonus?
    price.n_bonus_count > question.answers.where(vc_answer: true_answer.true_answer).count
  end

  def is_correct?
    vc_answer.downcase == question.true_answer.downcase
  end

  def update_attributes(new_attributes)
    self.attributes = new_attributes
  end

  def self.in_stats(user_id)
    where(user_id: user_id).delete_if(&:opened?)
  end

  def closed?
    question.d_time_stop < Time.now
  end

  def opened?
    !closed?
  end
end
