require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, questions: { errors: @question.errors, parameters: @question.parameters, prices: @question.prices, scores: @question.scores, stats: @question.stats, steps: @question.steps, true_answers: @question.true_answers }
    end

    assert_redirected_to question_path(assigns(:questions))
  end

  test "should show question" do
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    put :update, id: @question, questions: { errors: @question.errors, parameters: @question.parameters, prices: @question.prices, scores: @question.scores, stats: @question.stats, steps: @question.steps, true_answers: @question.true_answers }
    assert_redirected_to question_path(assigns(:questions))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end
