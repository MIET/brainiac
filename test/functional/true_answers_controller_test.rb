require 'test_helper'

class TrueAnswersControllerTest < ActionController::TestCase
  setup do
    @true_answer = true_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:true_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create true_answer" do
    assert_difference('TrueAnswer.count') do
      post :create, true_answer: { stats: @true_answer.stats, steps: @true_answer.steps }
    end

    assert_redirected_to true_answer_path(assigns(:true_answer))
  end

  test "should show true_answer" do
    get :show, id: @true_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @true_answer
    assert_response :success
  end

  test "should update true_answer" do
    put :update, id: @true_answer, true_answer: { stats: @true_answer.stats, steps: @true_answer.steps }
    assert_redirected_to true_answer_path(assigns(:true_answer))
  end

  test "should destroy true_answer" do
    assert_difference('TrueAnswer.count', -1) do
      delete :destroy, id: @true_answer
    end

    assert_redirected_to true_answers_path
  end
end
