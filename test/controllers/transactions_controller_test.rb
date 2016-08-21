require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase
  setup do
    @transaction = transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post :create, transaction: { account_bel: @transaction.account_bel, account_ver: @transaction.account_ver, active: @transaction.active, status: @transaction.status, status_bel: @transaction.status_bel, status_ver: @transaction.status_ver, trx_ref: @transaction.trx_ref, trx_text: @transaction.trx_text, valuta: @transaction.valuta }
    end

    assert_redirected_to transaction_path(assigns(:transaction))
  end

  test "should show transaction" do
    get :show, id: @transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transaction
    assert_response :success
  end

  test "should update transaction" do
    patch :update, id: @transaction, transaction: { account_bel: @transaction.account_bel, account_ver: @transaction.account_ver, active: @transaction.active, status: @transaction.status, status_bel: @transaction.status_bel, status_ver: @transaction.status_ver, trx_ref: @transaction.trx_ref, trx_text: @transaction.trx_text, valuta: @transaction.valuta }
    assert_redirected_to transaction_path(assigns(:transaction))
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete :destroy, id: @transaction
    end

    assert_redirected_to transactions_path
  end
end
