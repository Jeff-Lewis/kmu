require 'test_helper'

class WorkordersControllerTest < ActionController::TestCase
  setup do
    @workorder = workorders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workorders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workorder" do
    assert_difference('Workorder.count') do
      post :create, workorder: { description: @workorder.description, name: @workorder.name, user_id: @workorder.user_id }
    end

    assert_redirected_to workorder_path(assigns(:workorder))
  end

  test "should show workorder" do
    get :show, id: @workorder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workorder
    assert_response :success
  end

  test "should update workorder" do
    patch :update, id: @workorder, workorder: { description: @workorder.description, name: @workorder.name, user_id: @workorder.user_id }
    assert_redirected_to workorder_path(assigns(:workorder))
  end

  test "should destroy workorder" do
    assert_difference('Workorder.count', -1) do
      delete :destroy, id: @workorder
    end

    assert_redirected_to workorders_path
  end
end
