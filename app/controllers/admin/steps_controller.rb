module Admin
  class StepsController < ApplicationController
    include AdminHelper
    before_filter :require_auth
    skip_before_filter  :verify_authenticity_token
    def index
      @steps = Step.all
    end

    def new
      @step = Step.new
    end

    def edit
      @step = Step.find(params[:id])
    end

    def create
      @step = Step.new

      @step.renew_attributes(params.permit(:number, :step_desc))

      Step.new(step_number: params[:number], vc_step_desc: params[:step_desc]).save

      @steps = Step.all

      render :index
    end

    def update
      @step = Step.find(params[:id])

      @step.renew_attributes(params).save

      render 'admins/index'
    end

    def destroy
      @step = Step.find(params[:id])
      @step.destroy

      render 'admins/index'
    end
  end
end