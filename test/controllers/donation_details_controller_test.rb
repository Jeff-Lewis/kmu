require 'test_helper'

class DonationDetailsControllerTest < ActionController::TestCase
  setup do
    @donation_detail = donation_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donation_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donation_detail" do
    assert_difference('DonationDetail.count') do
      post :create, donation_detail: { avatar_content_type: @donation_detail.avatar_content_type, avatar_file_name: @donation_detail.avatar_file_name, avatar_file_size: @donation_detail.avatar_file_size, avatar_updated_at: @donation_detail.avatar_updated_at, description: @donation_detail.description, donation_id: @donation_detail.donation_id, name: @donation_detail.name }
    end

    assert_redirected_to donation_detail_path(assigns(:donation_detail))
  end

  test "should show donation_detail" do
    get :show, id: @donation_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @donation_detail
    assert_response :success
  end

  test "should update donation_detail" do
    patch :update, id: @donation_detail, donation_detail: { avatar_content_type: @donation_detail.avatar_content_type, avatar_file_name: @donation_detail.avatar_file_name, avatar_file_size: @donation_detail.avatar_file_size, avatar_updated_at: @donation_detail.avatar_updated_at, description: @donation_detail.description, donation_id: @donation_detail.donation_id, name: @donation_detail.name }
    assert_redirected_to donation_detail_path(assigns(:donation_detail))
  end

  test "should destroy donation_detail" do
    assert_difference('DonationDetail.count', -1) do
      delete :destroy, id: @donation_detail
    end

    assert_redirected_to donation_details_path
  end
end
