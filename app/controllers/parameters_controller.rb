class ParametersController < ApplicationController
  def show
    @parameter = Parameter.find_by_vc_parameter_code(params[:id]) if params[:id].to_i.zero?
  end
end