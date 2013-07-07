class Price < ActiveRecord::Base
  self.primary_key = "n_price_id"

  belongs_to :question,
             foreign_key: 'n_question_id'

  def renew_attributes(params)
    self[:n_bonus_count] = params[:n_bonus_count]
    self[:n_bonus_price] = params[:n_bonus_price]
    self[:n_normal_price] = params[:n_normal_price]
  end
end
