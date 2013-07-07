class User < ActiveRecord::Base
  require 'json'
  self.primary_key = "n_user_id"

  has_many :answers,
           foreign_key: 'n_user_id'

  def initialize(params)
    super()
    self[:n_vk_id] = params[:viewer_id]
    response = JSON.parse(params['api_result'])['response'].first.symbolize_keys!
    self[:vc_first_name] = response[:first_name]
    self[:vc_last_name] = response[:last_name]
    self[:n_max_step] = 1
    self[:n_total_score] = 0
  end

  def admin?
    @admins ||= Parameter.admins
    @admins.include?(n_vk_id.to_s)
  end

  def refresh_stats
    total = 0
    answers.each do |answer|
      total += answer[:n_scores]
    end
    self[:n_total_score] = total
    save
  end

  def has_answer?
    !!answers.find{|answer| answer[:n_question_id] == Question.current.id}
  end

  def has_no_answer?
    !has_answer?
  end
end