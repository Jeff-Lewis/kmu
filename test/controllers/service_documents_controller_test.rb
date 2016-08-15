require 'test_helper'

class ServiceDocumentsControllerTest < ActionController::TestCase
  setup do
    @service_document = service_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_document" do
    assert_difference('ServiceDocument.count') do
      post :create, service_document: { description: @service_document.description, document_content_type: @service_document.document_content_type, document_file_name: @service_document.document_file_name, document_file_size: @service_document.document_file_size, document_updated_at: @service_document.document_updated_at, name: @service_document.name, service_id: @service_document.service_id }
    end

    assert_redirected_to service_document_path(assigns(:service_document))
  end

  test "should show service_document" do
    get :show, id: @service_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_document
    assert_response :success
  end

  test "should update service_document" do
    patch :update, id: @service_document, service_document: { description: @service_document.description, document_content_type: @service_document.document_content_type, document_file_name: @service_document.document_file_name, document_file_size: @service_document.document_file_size, document_updated_at: @service_document.document_updated_at, name: @service_document.name, service_id: @service_document.service_id }
    assert_redirected_to service_document_path(assigns(:service_document))
  end

  test "should destroy service_document" do
    assert_difference('ServiceDocument.count', -1) do
      delete :destroy, id: @service_document
    end

    assert_redirected_to service_documents_path
  end
end
