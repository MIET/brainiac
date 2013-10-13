module Admin
  class ParametersController < ApplicationController
    include AdminHelper
    before_filter :require_auth
    skip_before_filter  :verify_authenticity_token
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