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
    now = Time.now.strftime '%Y-%m-%d %H:%M:%S'
    Question.where("d_time_start < '#{now}'").where("d_time_stop > '#{now}'").first
  end

  def self.closed
    now = Time.now.strftime '%Y-%m-%d %H:%M:%S'
    Question.where("d_time_stop < '#{now}'").first
  end
end
