require 'test_helper'

class BidDetailsControllerTest < ActionController::TestCase
  setup do
    @bid_detail = bid_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bid_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bid_detail" do
    assert_difference('BidDetail.count') do
      post :create, bid_detail: { avatar_content_type: @bid_detail.avatar_content_type, avatar_file_name: @bid_detail.avatar_file_name, avatar_file_size: @bid_detail.avatar_file_size, avatar_updated_at: @bid_detail.avatar_updated_at, bid_id: @bid_detail.bid_id, description: @bid_detail.description, name: @bid_detail.name }
    end

    assert_redirected_to bid_detail_path(assigns(:bid_detail))
  end

  test "should show bid_detail" do
    get :show, id: @bid_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bid_detail
    assert_response :success
  end

  test "should update bid_detail" do
    patch :update, id: @bid_detail, bid_detail: { avatar_content_type: @bid_detail.avatar_content_type, avatar_file_name: @bid_detail.avatar_file_name, avatar_file_size: @bid_detail.avatar_file_size, avatar_updated_at: @bid_detail.avatar_updated_at, bid_id: @bid_detail.bid_id, description: @bid_detail.description, name: @bid_detail.name }
    assert_redirected_to bid_detail_path(assigns(:bid_detail))
  end

  test "should destroy bid_detail" do
    assert_difference('BidDetail.count', -1) do
      delete :destroy, id: @bid_detail
    end

    assert_redirected_to bid_details_path
  end
end
