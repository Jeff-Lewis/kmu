require 'test_helper'

class TimetracksControllerTest < ActionController::TestCase
  setup do
    @timetrack = timetracks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timetracks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timetrack" do
    assert_difference('Timetrack.count') do
      post :create, timetrack: { amount: @timetrack.amount, hour_or_cost: @timetrack.hour_or_cost, user_id: @timetrack.user_id, workorder_id: @timetrack.workorder_id }
    end

    assert_redirected_to timetrack_path(assigns(:timetrack))
  end

  test "should show timetrack" do
    get :show, id: @timetrack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timetrack
    assert_response :success
  end

  test "should update timetrack" do
    patch :update, id: @timetrack, timetrack: { amount: @timetrack.amount, hour_or_cost: @timetrack.hour_or_cost, user_id: @timetrack.user_id, workorder_id: @timetrack.workorder_id }
    assert_redirected_to timetrack_path(assigns(:timetrack))
  end

  test "should destroy timetrack" do
    assert_difference('Timetrack.count', -1) do
      delete :destroy, id: @timetrack
    end

    assert_redirected_to timetracks_path
  end
end
