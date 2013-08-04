class AnswersController < ApplicationController
  include MainHelper

  before_action :check_user
  skip_before_filter  :verify_authenticity_token

  def index
    @answers = Answer.all

    respond_to do |format|
      format.html # index.haml
      format.json { render json: @answers }
    end
  end

  def create
    @answer = Answer.new(params)
    @answer[:n_user_id] = cookies.signed[:n_user_id]
    @answer.save
    render 'main/index'
  end
end
