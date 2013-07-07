class TrueAnswersController < ApplicationController
  include Auth
  # GET /true_answers
  # GET /true_answers.json
  def index
    @true_answers = TrueAnswer.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @true_answer = TrueAnswer.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  # GET /true_answers/new
  # GET /true_answers/new.json
  def new
    @true_answer = TrueAnswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @true_answer }
    end
  end

  # GET /true_answers/1/edit
  def edit
    @true_answer = TrueAnswer.find(params[:id])
  end

  # POST /true_answers
  # POST /true_answers.json
  def create
    @true_answer = TrueAnswer.new(params[:true_answer])

    respond_to do |format|
      if @true_answer.save
        format.html { redirect_to @true_answer, notice: 'True answer was successfully created.' }
        format.json { render json: @true_answer, status: :created, location: @true_answer }
      else
        format.html { render action: "new" }
        format.json { render json: @true_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /true_answers/1
  # PUT /true_answers/1.json
  def update
    @true_answer = TrueAnswer.find(params[:id])

    respond_to do |format|
      if @true_answer.update_attributes(params[:true_answer])
        format.html { redirect_to @true_answer, notice: 'True answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @true_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /true_answers/1
  # DELETE /true_answers/1.json
  def destroy
    @true_answer = TrueAnswer.find(params[:id])
    @true_answer.destroy

    respond_to do |format|
      format.html { redirect_to true_answers_url }
      format.json { head :no_content }
    end
  end
end
