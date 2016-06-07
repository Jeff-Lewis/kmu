require 'test_helper'

class HotspotDetailsControllerTest < ActionController::TestCase
  setup do
    @hotspot_detail = hotspot_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotspot_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotspot_detail" do
    assert_difference('HotspotDetail.count') do
      post :create, hotspot_detail: { avatar_content_type: @hotspot_detail.avatar_content_type, avatar_file_name: @hotspot_detail.avatar_file_name, avatar_file_size: @hotspot_detail.avatar_file_size, avatar_updated_at: @hotspot_detail.avatar_updated_at, description: @hotspot_detail.description, hotspot_id: @hotspot_detail.hotspot_id, name: @hotspot_detail.name, status: @hotspot_detail.status }
    end

    assert_redirected_to hotspot_detail_path(assigns(:hotspot_detail))
  end

  test "should show hotspot_detail" do
    get :show, id: @hotspot_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotspot_detail
    assert_response :success
  end

  test "should update hotspot_detail" do
    patch :update, id: @hotspot_detail, hotspot_detail: { avatar_content_type: @hotspot_detail.avatar_content_type, avatar_file_name: @hotspot_detail.avatar_file_name, avatar_file_size: @hotspot_detail.avatar_file_size, avatar_updated_at: @hotspot_detail.avatar_updated_at, description: @hotspot_detail.description, hotspot_id: @hotspot_detail.hotspot_id, name: @hotspot_detail.name, status: @hotspot_detail.status }
    assert_redirected_to hotspot_detail_path(assigns(:hotspot_detail))
  end

  test "should destroy hotspot_detail" do
    assert_difference('HotspotDetail.count', -1) do
      delete :destroy, id: @hotspot_detail
    end

    assert_redirected_to hotspot_details_path
  end
end
