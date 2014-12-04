class Parameter < ActiveRecord::Base
  self.primary_key = "n_parameter_id"

  def renew_attributes(params)
    self.attributes = params.permit(:vc_value, :n_value)
    self
  end

  def self.filter
    find_by(:vc_parameter_code, 'filter')[:vc_value]
  end

  def self.admins
    find_by(:vc_parameter_code, 'admins')[:vc_value].split(',')
  end
end
