require 'test_helper'

class HsRatingsControllerTest < ActionController::TestCase
  setup do
    @hs_rating = hs_ratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hs_ratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hs_rating" do
    assert_difference('HsRating.count') do
      post :create, hs_rating: { hotspot_id: @hs_rating.hotspot_id, status: @hs_rating.status, user_comment: @hs_rating.user_comment, user_id: @hs_rating.user_id, user_rating: @hs_rating.user_rating }
    end

    assert_redirected_to hs_rating_path(assigns(:hs_rating))
  end

  test "should show hs_rating" do
    get :show, id: @hs_rating
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hs_rating
    assert_response :success
  end

  test "should update hs_rating" do
    patch :update, id: @hs_rating, hs_rating: { hotspot_id: @hs_rating.hotspot_id, status: @hs_rating.status, user_comment: @hs_rating.user_comment, user_id: @hs_rating.user_id, user_rating: @hs_rating.user_rating }
    assert_redirected_to hs_rating_path(assigns(:hs_rating))
  end

  test "should destroy hs_rating" do
    assert_difference('HsRating.count', -1) do
      delete :destroy, id: @hs_rating
    end

    assert_redirected_to hs_ratings_path
  end
end
