require 'test_helper'

class PlanningsControllerTest < ActionController::TestCase
  setup do
    @planning = plannings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plannings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planning" do
    assert_difference('Planning.count') do
      post :create, planning: { amount: @planning.amount, ending_date: @planning.ending_date, event: @planning.event, starting_date: @planning.starting_date, user_id: @planning.user_id, workorder_id: @planning.workorder_id }
    end

    assert_redirected_to planning_path(assigns(:planning))
  end

  test "should show planning" do
    get :show, id: @planning
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planning
    assert_response :success
  end

  test "should update planning" do
    patch :update, id: @planning, planning: { amount: @planning.amount, ending_date: @planning.ending_date, event: @planning.event, starting_date: @planning.starting_date, user_id: @planning.user_id, workorder_id: @planning.workorder_id }
    assert_redirected_to planning_path(assigns(:planning))
  end

  test "should destroy planning" do
    assert_difference('Planning.count', -1) do
      delete :destroy, id: @planning
    end

    assert_redirected_to plannings_path
  end
end
