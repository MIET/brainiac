module Admin
  class ParametersController < ApplicationController
    def edit
      @parameter = Parameter.find_by_vc_parameter_code(params[:id])
    end

    def update
      @parameter = Parameter.find_by_vc_parameter_code(params[:id])
      @parameter.renew_attributes(params).save

      redirect_to '/admins'
    end
  end
end