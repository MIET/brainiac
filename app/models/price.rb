class Price < ActiveRecord::Base
  self.primary_key = "n_price_id"

  belongs_to :question,
             foreign_key: 'question_id'

  def renew_attributes(params)
    self.attributes = params.permit(:n_bonus_count, :n_bonus_price, :n_normal_price)
  end
end
