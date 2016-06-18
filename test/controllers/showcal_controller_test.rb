require 'test_helper'

class ShowcalControllerTest < ActionController::TestCase
  test "should get action" do
    get :action
    assert_response :success
  end

  test "should get bid" do
    get :bid
    assert_response :success
  end

  test "should get event" do
    get :event
    assert_response :success
  end

end
