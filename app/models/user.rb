class User < ActiveRecord::Base
  require 'json'
  self.primary_key = 'user_id'

  has_many :answers,
           foreign_key: :user_id

  default_scope order('total_score desc')

  def initialize(params)
    super
    # TODO Remove it shit from model
    self.n_vk_id = params[:viewer_id]
    self.first_name, self.vc_last_name = last_and_first_name(params)
    self.n_max_step = 1
    self.total_score = 0
  end

  def last_and_first_name(params)
    #TODO Adapter
    response = JSON.parse(params['api_result'])['response'].first.symbolize_keys!
    [response[:first_name], response[:last_name]]
  end

  def admin?
    @admins ||= Parameter.admins
    @admins.include?(n_vk_id.to_s)
  end

  def refresh_stats
    total = 0
    answers.each do |answer|
      total += answer.n_scores
    end
    self.total_score = total
    save
  end

  def has_current_answer?
    answers.find(&:opened?)
  end

  def has_no_current_answer?
    !has_current_answer?
  end

  def has_answers?
    answers.count > 0
  end

  def has_no_answers?
    !has_answers?
  end

  def self.answered_last
    Rails.cache.fetch(:answered_users, expires_in: 20.minutes ) do
      users = []
      last_question = Question.last
      return [] if last_question.nil?
      last_question.answers.each do |answer|
        users << answer.user
      end
      users.sort{|x,y| y.total_score <=> x.total_score}
    end
  end
end