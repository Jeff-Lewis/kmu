require 'test_helper'

class StatsControllerTest < ActionController::TestCase
  test "should get user" do
    get :user
    assert_response :success
  end

  test "should get workorder" do
    get :workorder
    assert_response :success
  end

end
