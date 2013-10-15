class Question < ActiveRecord::Base
  self.primary_key = "n_question_id"

  has_many :answers,
           foreign_key: 'n_question_id'

  belongs_to :step,
             foreign_key: 'n_step_id'

  has_one    :true_answer,
             foreign_key: 'n_question_id',
             :autosave => true

  has_one    :price,
             foreign_key: 'n_question_id',
             :autosave => true

  scope :from_last, order('d_time_stop')

  def renew_attributes(params)
    step = Step.find_by_n_step_number(params[:step_number])
    self[:n_step_id] = step[:n_step_id]
    self[:n_step_number] = params[:step_number]
    self[:n_number] = params[:question_number]
    self[:vc_text] =  params[:question_text]
    self[:d_time_start] = params[:d_begin]
    self[:d_time_stop] = params[:d_end]
    price[:n_bonus_count] = params[:bonus_count]
    price[:n_bonus_price] = params[:bonus_price]
    price[:n_normal_price] = params[:normal_price]
    self
  end

  def self.current
    now = Time.now.in_time_zone('Europe/Moscow').strftime '%Y-%m-%d %H:%M:%S'
    @answers = Rails.cache.fetch(:current_question, expires_in: 15.minutes ) do
      Rails.logger.info('Get from base')
      Question.where("d_time_start < '#{now}'").where("d_time_stop > '#{now}'").first
    end
  end

  def self.closed
    now = Time.now.in_time_zone('Europe/Moscow').strftime '%Y-%m-%d %H:%M:%S'
    Question.where("d_time_stop < '#{now}'").first
  end

  def self.last
    Rails.cache.fetch(:last_question, expires_in: 1.hours ) do
      Rails.logger.info('Get from base')
      Question.from_last.first
    end
  end

  def mini_text
    if self[:vc_text].length > 30
      "#{self[:vc_text][0..30]}..."
    else
      self[:vc_text]
    end
  end
end
