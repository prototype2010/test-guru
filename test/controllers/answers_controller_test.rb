require "test_helper"

class AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answer = answers(:one)
  end

  test "should get index" do
    get answers_url
    assert_response :success
  end

  test "should get new" do
    get new_answer_path
    assert_response :success
  end

  test "should create answer" do
    assert_difference('Answer.count') do
      post answers_path, params: { answer: {  } }
    end

    assert_redirected_to answer_path(Answer.last)
  end

  test "should show answer" do
    get answer_path(@answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_answer_path(@answer)
    assert_response :success
  end

  test "should update answer" do
    patch answer_path(@answer), params: { answer: {  } }
    assert_redirected_to answer_path(@answer)
  end

  test "should destroy answer" do
    assert_difference('Answer.count', -1) do
      delete answer_path(@answer)
    end

    assert_redirected_to answers_path
  end
end
