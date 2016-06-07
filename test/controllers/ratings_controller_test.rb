require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
  setup do
    @rating = ratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rating" do
    assert_difference('Rating.count') do
      post :create, rating: { anbieter_comment: @rating.anbieter_comment, anbieter_rating: @rating.anbieter_rating, service_id: @rating.service_id, user_comment: @rating.user_comment, user_id: @rating.user_id, user_rating: @rating.user_rating }
    end

    assert_redirected_to rating_path(assigns(:rating))
  end

  test "should show rating" do
    get :show, id: @rating
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rating
    assert_response :success
  end

  test "should update rating" do
    patch :update, id: @rating, rating: { anbieter_comment: @rating.anbieter_comment, anbieter_rating: @rating.anbieter_rating, service_id: @rating.service_id, user_comment: @rating.user_comment, user_id: @rating.user_id, user_rating: @rating.user_rating }
    assert_redirected_to rating_path(assigns(:rating))
  end

  test "should destroy rating" do
    assert_difference('Rating.count', -1) do
      delete :destroy, id: @rating
    end

    assert_redirected_to ratings_path
  end
end
