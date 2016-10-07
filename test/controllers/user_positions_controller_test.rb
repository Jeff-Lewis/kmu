require 'test_helper'

class UserPositionsControllerTest < ActionController::TestCase
  setup do
    @user_position = user_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_position" do
    assert_difference('UserPosition.count') do
      post :create, user_position: { geo_address: @user_position.geo_address, latitude: @user_position.latitude, longitude: @user_position.longitude, user_id: @user_position.user_id }
    end

    assert_redirected_to user_position_path(assigns(:user_position))
  end

  test "should show user_position" do
    get :show, id: @user_position
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_position
    assert_response :success
  end

  test "should update user_position" do
    patch :update, id: @user_position, user_position: { geo_address: @user_position.geo_address, latitude: @user_position.latitude, longitude: @user_position.longitude, user_id: @user_position.user_id }
    assert_redirected_to user_position_path(assigns(:user_position))
  end

  test "should destroy user_position" do
    assert_difference('UserPosition.count', -1) do
      delete :destroy, id: @user_position
    end

    assert_redirected_to user_positions_path
  end
end
