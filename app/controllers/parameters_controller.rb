class ParametersController < ApplicationController
  def show
    if params[:id].to_i.zero?
      @parameter = Parameter.find_by_vc_parameter_code(params[:id])
    end
  end
end