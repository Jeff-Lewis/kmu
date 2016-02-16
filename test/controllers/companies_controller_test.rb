require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { active: @company.active, address1: @company.address1, adress2: @company.adress2, adress3: @company.adress3, avatar_content_type: @company.avatar_content_type, avatar_file_name: @company.avatar_file_name, avatar_file_size: @company.avatar_file_size, avatar_updated_at: @company.avatar_updated_at, description: @company.description, name: @company.name, phone1: @company.phone1, phone2: @company.phone2 }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    patch :update, id: @company, company: { active: @company.active, address1: @company.address1, adress2: @company.adress2, adress3: @company.adress3, avatar_content_type: @company.avatar_content_type, avatar_file_name: @company.avatar_file_name, avatar_file_size: @company.avatar_file_size, avatar_updated_at: @company.avatar_updated_at, description: @company.description, name: @company.name, phone1: @company.phone1, phone2: @company.phone2 }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
