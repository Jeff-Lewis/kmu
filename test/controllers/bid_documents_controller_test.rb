require 'test_helper'

class BidDocumentsControllerTest < ActionController::TestCase
  setup do
    @bid_document = bid_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bid_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bid_document" do
    assert_difference('BidDocument.count') do
      post :create, bid_document: { bid_id: @bid_document.bid_id, company_id: @bid_document.company_id, description: @bid_document.description, name: @bid_document.name, status: @bid_document.status }
    end

    assert_redirected_to bid_document_path(assigns(:bid_document))
  end

  test "should show bid_document" do
    get :show, id: @bid_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bid_document
    assert_response :success
  end

  test "should update bid_document" do
    patch :update, id: @bid_document, bid_document: { bid_id: @bid_document.bid_id, company_id: @bid_document.company_id, description: @bid_document.description, name: @bid_document.name, status: @bid_document.status }
    assert_redirected_to bid_document_path(assigns(:bid_document))
  end

  test "should destroy bid_document" do
    assert_difference('BidDocument.count', -1) do
      delete :destroy, id: @bid_document
    end

    assert_redirected_to bid_documents_path
  end
end
