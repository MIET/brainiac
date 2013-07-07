module Admin
  class StepsController < ApplicationController
    def index
      @steps = Step.all
    end

    def new
      @step = Step.new
    end

    # GET /questions/1/edit
    def edit
      @step = Step.find(params[:id])
    end

    # POST /questions
    # POST /questions.json
    def create
      Step.new(n_step_number: params[:number], vc_step_desc: params[:description]).save

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