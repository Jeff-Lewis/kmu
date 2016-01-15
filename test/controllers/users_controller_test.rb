require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { adress1: @user.adress1, adress2: @user.adress2, adress3: @user.adress3, costinfo1: @user.costinfo1, costinfo2: @user.costinfo2, costrate: @user.costrate, image: @user.image, lastname: @user.lastname, name: @user.name, org: @user.org, password: @user.password, phone1: @user.phone1, phone2: @user.phone2, userid: @user.userid }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { adress1: @user.adress1, adress2: @user.adress2, adress3: @user.adress3, costinfo1: @user.costinfo1, costinfo2: @user.costinfo2, costrate: @user.costrate, image: @user.image, lastname: @user.lastname, name: @user.name, org: @user.org, password: @user.password, phone1: @user.phone1, phone2: @user.phone2, userid: @user.userid }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
