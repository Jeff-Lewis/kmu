require 'test_helper'

class WebmasterControllerTest < ActionController::TestCase
  test "should get scaffold" do
    get :scaffold
    assert_response :success
  end

  test "should get webmaster" do
    get :webmaster
    assert_response :success
  end

  test "should get object_name:string" do
    get :object_name:string
    assert_response :success
  end

  test "should get object_id:integer" do
    get :object_id:integer
    assert_response :success
  end

  test "should get user_id:integer" do
    get :user_id:integer
    assert_response :success
  end

  test "should get web_user_id:integer" do
    get :web_user_id:integer
    assert_response :success
  end

  test "should get user_comment:text" do
    get :user_comment:text
    assert_response :success
  end

  test "should get web_user_comment:text" do
    get :web_user_comment:text
    assert_response :success
  end

  test "should get status:string" do
    get :status:string
    assert_response :success
  end

end
