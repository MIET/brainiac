class Step < ActiveRecord::Base
  self.primary_key = "n_step_id"

  has_many :questions

  has_many :answers

  def renew_attributes(params)
    self[:n_step_number] = params[:n_step_number]
    self[:vc_step_desc]  = params[:vc_step_desc]
    self
  end
end
