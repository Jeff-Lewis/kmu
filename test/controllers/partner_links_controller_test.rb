require 'test_helper'

class PartnerLinksControllerTest < ActionController::TestCase
  setup do
    @partner_link = partner_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partner_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partner_link" do
    assert_difference('PartnerLink.count') do
      post :create, partner_link: { active: @partner_link.active, avatar_content_type: @partner_link.avatar_content_type, avatar_file_name: @partner_link.avatar_file_name, avatar_file_size: @partner_link.avatar_file_size, avatar_updated_at: @partner_link.avatar_updated_at, description: @partner_link.description, link: @partner_link.link, name: @partner_link.name, partner_id: @partner_link.partner_id }
    end

    assert_redirected_to partner_link_path(assigns(:partner_link))
  end

  test "should show partner_link" do
    get :show, id: @partner_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @partner_link
    assert_response :success
  end

  test "should update partner_link" do
    patch :update, id: @partner_link, partner_link: { active: @partner_link.active, avatar_content_type: @partner_link.avatar_content_type, avatar_file_name: @partner_link.avatar_file_name, avatar_file_size: @partner_link.avatar_file_size, avatar_updated_at: @partner_link.avatar_updated_at, description: @partner_link.description, link: @partner_link.link, name: @partner_link.name, partner_id: @partner_link.partner_id }
    assert_redirected_to partner_link_path(assigns(:partner_link))
  end

  test "should destroy partner_link" do
    assert_difference('PartnerLink.count', -1) do
      delete :destroy, id: @partner_link
    end

    assert_redirected_to partner_links_path
  end
end
