require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get showmap" do
    get :showmap
    assert_response :success
  end

  test "should get sendmail" do
    get :sendmail
    assert_response :success
  end

end
