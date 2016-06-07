require 'test_helper'

class FavouritsControllerTest < ActionController::TestCase
  setup do
    @favourit = favourits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favourits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favourit" do
    assert_difference('Favourit.count') do
      post :create, favourit: { active: @favourit.active, category: @favourit.category, email: @favourit.email, object_id: @favourit.object_id, object_name: @favourit.object_name, stichworte: @favourit.stichworte, ticker: @favourit.ticker, user_id: @favourit.user_id }
    end

    assert_redirected_to favourit_path(assigns(:favourit))
  end

  test "should show favourit" do
    get :show, id: @favourit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favourit
    assert_response :success
  end

  test "should update favourit" do
    patch :update, id: @favourit, favourit: { active: @favourit.active, category: @favourit.category, email: @favourit.email, object_id: @favourit.object_id, object_name: @favourit.object_name, stichworte: @favourit.stichworte, ticker: @favourit.ticker, user_id: @favourit.user_id }
    assert_redirected_to favourit_path(assigns(:favourit))
  end

  test "should destroy favourit" do
    assert_difference('Favourit.count', -1) do
      delete :destroy, id: @favourit
    end

    assert_redirected_to favourits_path
  end
end
