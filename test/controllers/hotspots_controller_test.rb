require 'test_helper'

class HotspotsControllerTest < ActionController::TestCase
  setup do
    @hotspot = hotspots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotspots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotspot" do
    assert_difference('Hotspot.count') do
      post :create, hotspot: { active: @hotspot.active, address1: @hotspot.address1, address2: @hotspot.address2, address3: @hotspot.address3, description: @hotspot.description, geo_address: @hotspot.geo_address, hs_category_id: @hotspot.hs_category_id, latitude: @hotspot.latitude, longitude: @hotspot.longitude, name: @hotspot.name, status: @hotspot.status, stichworte: @hotspot.stichworte, user_id: @hotspot.user_id }
    end

    assert_redirected_to hotspot_path(assigns(:hotspot))
  end

  test "should show hotspot" do
    get :show, id: @hotspot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotspot
    assert_response :success
  end

  test "should update hotspot" do
    patch :update, id: @hotspot, hotspot: { active: @hotspot.active, address1: @hotspot.address1, address2: @hotspot.address2, address3: @hotspot.address3, description: @hotspot.description, geo_address: @hotspot.geo_address, hs_category_id: @hotspot.hs_category_id, latitude: @hotspot.latitude, longitude: @hotspot.longitude, name: @hotspot.name, status: @hotspot.status, stichworte: @hotspot.stichworte, user_id: @hotspot.user_id }
    assert_redirected_to hotspot_path(assigns(:hotspot))
  end

  test "should destroy hotspot" do
    assert_difference('Hotspot.count', -1) do
      delete :destroy, id: @hotspot
    end

    assert_redirected_to hotspots_path
  end
end
