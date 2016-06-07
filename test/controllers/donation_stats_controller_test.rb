require 'test_helper'

class DonationStatsControllerTest < ActionController::TestCase
  setup do
    @donation_stat = donation_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donation_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donation_stat" do
    assert_difference('DonationStat.count') do
      post :create, donation_stat: { amount: @donation_stat.amount, anonymous: @donation_stat.anonymous, company_id: @donation_stat.company_id, donation_id: @donation_stat.donation_id, user_id: @donation_stat.user_id }
    end

    assert_redirected_to donation_stat_path(assigns(:donation_stat))
  end

  test "should show donation_stat" do
    get :show, id: @donation_stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @donation_stat
    assert_response :success
  end

  test "should update donation_stat" do
    patch :update, id: @donation_stat, donation_stat: { amount: @donation_stat.amount, anonymous: @donation_stat.anonymous, company_id: @donation_stat.company_id, donation_id: @donation_stat.donation_id, user_id: @donation_stat.user_id }
    assert_redirected_to donation_stat_path(assigns(:donation_stat))
  end

  test "should destroy donation_stat" do
    assert_difference('DonationStat.count', -1) do
      delete :destroy, id: @donation_stat
    end

    assert_redirected_to donation_stats_path
  end
end
