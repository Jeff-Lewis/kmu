require 'test_helper'

class TickerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
