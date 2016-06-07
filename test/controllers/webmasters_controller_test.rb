require 'test_helper'

class WebmastersControllerTest < ActionController::TestCase
  setup do
    @webmaster = webmasters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:webmasters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create webmaster" do
    assert_difference('Webmaster.count') do
      post :create, webmaster: { object_id: @webmaster.object_id, object_name: @webmaster.object_name, status: @webmaster.status, user_comment: @webmaster.user_comment, user_id: @webmaster.user_id, web_user_comment: @webmaster.web_user_comment, web_user_id: @webmaster.web_user_id }
    end

    assert_redirected_to webmaster_path(assigns(:webmaster))
  end

  test "should show webmaster" do
    get :show, id: @webmaster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @webmaster
    assert_response :success
  end

  test "should update webmaster" do
    patch :update, id: @webmaster, webmaster: { object_id: @webmaster.object_id, object_name: @webmaster.object_name, status: @webmaster.status, user_comment: @webmaster.user_comment, user_id: @webmaster.user_id, web_user_comment: @webmaster.web_user_comment, web_user_id: @webmaster.web_user_id }
    assert_redirected_to webmaster_path(assigns(:webmaster))
  end

  test "should destroy webmaster" do
    assert_difference('Webmaster.count', -1) do
      delete :destroy, id: @webmaster
    end

    assert_redirected_to webmasters_path
  end
end
