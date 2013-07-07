class Parameter < ActiveRecord::Base
  self.primary_key = "n_parameter_id"

  def renew_attributes(params)
    self[:vc_value] = params[:vc_value]
    self[:n_value] = params[:n_value]
    self
  end
end
