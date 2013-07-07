class Parameter < ActiveRecord::Base
  self.primary_key = "n_parameter_id"

  def renew_attributes(params)
    self[:vc_value] = params[:vc_value]
    self[:n_value] = params[:n_value]
    self
  end

  def self.filter
    Parameter.find_by_vc_parameter_code('filter')[:vc_value]
  end

  def self.admins
    Parameter.find_by_vc_parameter_code('admins')[:vc_value].split(',')
  end
end
