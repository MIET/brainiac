class Question < ActiveRecord::Base
  self.primary_key = 'question_id'

  has_many :answers

  belongs_to :step,
             foreign_key: :step_id

  has_one    :true_answer,
             :autosave => true

  has_one    :price,
             :autosave => true

  scope :from_last, order('d_time_stop desc')

  def renew_attributes(params)
    step = Step.find_by(:step_number, (params[:step_number]))
    step.questions.build(params.permit(:step_number, :n_number, :vc_text, :d_time_start, :d_time_stop))
    price.attributes = params.permit(:bonus_count, :bonus_price, :normal_price)
    self
  end

  def self.current
    now = Time.now.strftime '%Y-%m-%d %H:%M:%S'
    @answers = Rails.cache.fetch(:current_question, expires_in: 15.minutes ) do
      Rails.logger.info('Get from base')
      Question.where("d_time_start < '#{now}'").where("d_time_stop > '#{now}'").first
    end
  end

  def self.closed
    Question.where("d_time_stop < '#{Time.now.strftime '%Y-%m-%d %H:%M:%S'}'").first
  end

  def self.last
    Rails.cache.fetch(:last_question, expires_in: 1.hours ) do
      Rails.logger.info('Get from base')
      Question.from_last.first
    end
  end

  def mini_text
    self[:vc_text][0..30]
  end
end
