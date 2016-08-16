require 'test_helper'

class AppointmentDocumentsControllerTest < ActionController::TestCase
  setup do
    @appointment_document = appointment_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appointment_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appointment_document" do
    assert_difference('AppointmentDocument.count') do
      post :create, appointment_document: { appointment_id: @appointment_document.appointment_id, description: @appointment_document.description, document_content_type: @appointment_document.document_content_type, document_file_name: @appointment_document.document_file_name, document_file_size: @appointment_document.document_file_size, document_updated_at: @appointment_document.document_updated_at, name: @appointment_document.name }
    end

    assert_redirected_to appointment_document_path(assigns(:appointment_document))
  end

  test "should show appointment_document" do
    get :show, id: @appointment_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appointment_document
    assert_response :success
  end

  test "should update appointment_document" do
    patch :update, id: @appointment_document, appointment_document: { appointment_id: @appointment_document.appointment_id, description: @appointment_document.description, document_content_type: @appointment_document.document_content_type, document_file_name: @appointment_document.document_file_name, document_file_size: @appointment_document.document_file_size, document_updated_at: @appointment_document.document_updated_at, name: @appointment_document.name }
    assert_redirected_to appointment_document_path(assigns(:appointment_document))
  end

  test "should destroy appointment_document" do
    assert_difference('AppointmentDocument.count', -1) do
      delete :destroy, id: @appointment_document
    end

    assert_redirected_to appointment_documents_path
  end
end
