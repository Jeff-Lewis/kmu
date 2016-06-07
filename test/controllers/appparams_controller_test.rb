require 'test_helper'

class AppparamsControllerTest < ActionController::TestCase
  setup do
    @appparam = appparams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appparams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appparam" do
    assert_difference('Appparam.count') do
      post :create, appparam: { active: @appparam.active, description: @appparam.description, name: @appparam.name }
    end

    assert_redirected_to appparam_path(assigns(:appparam))
  end

  test "should show appparam" do
    get :show, id: @appparam
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appparam
    assert_response :success
  end

  test "should update appparam" do
    patch :update, id: @appparam, appparam: { active: @appparam.active, description: @appparam.description, name: @appparam.name }
    assert_redirected_to appparam_path(assigns(:appparam))
  end

  test "should destroy appparam" do
    assert_difference('Appparam.count', -1) do
      delete :destroy, id: @appparam
    end

    assert_redirected_to appparams_path
  end
end
