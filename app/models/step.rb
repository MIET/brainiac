class Step < ActiveRecord::Base
  self.primary_key = "step_id"

  has_many :questions

  has_many :answers

  def renew_attributes(params)
    params.permit(:step_number, :step_desc)
  end
end
