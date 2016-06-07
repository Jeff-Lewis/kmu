require 'test_helper'

class BidsControllerTest < ActionController::TestCase
  setup do
    @bid = bids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bid" do
    assert_difference('Bid.count') do
      post :create, bid: { active: @bid.active, address1: @bid.address1, address2: @bid.address2, address3: @bid.address3, asap: @bid.asap, category_id: @bid.category_id, description: @bid.description, geo_address: @bid.geo_address, latitude: @bid.latitude, longitude: @bid.longitude, name: @bid.name, user_id: @bid.user_id }
    end

    assert_redirected_to bid_path(assigns(:bid))
  end

  test "should show bid" do
    get :show, id: @bid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bid
    assert_response :success
  end

  test "should update bid" do
    patch :update, id: @bid, bid: { active: @bid.active, address1: @bid.address1, address2: @bid.address2, address3: @bid.address3, asap: @bid.asap, category_id: @bid.category_id, description: @bid.description, geo_address: @bid.geo_address, latitude: @bid.latitude, longitude: @bid.longitude, name: @bid.name, user_id: @bid.user_id }
    assert_redirected_to bid_path(assigns(:bid))
  end

  test "should destroy bid" do
    assert_difference('Bid.count', -1) do
      delete :destroy, id: @bid
    end

    assert_redirected_to bids_path
  end
end
