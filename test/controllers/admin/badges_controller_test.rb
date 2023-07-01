require "test_helper"

class Admin::BadgesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_badges_show_url
    assert_response :success
  end

  test "should get create" do
    get admin_badges_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_badges_edit_url
    assert_response :success
  end

  test "should get new" do
    get admin_badges_new_url
    assert_response :success
  end

  test "should get update" do
    get admin_badges_update_url
    assert_response :success
  end

  test "should get delete" do
    get admin_badges_delete_url
    assert_response :success
  end
end
