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
  end
end