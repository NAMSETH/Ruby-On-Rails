require 'test_helper'

class AdminCustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_customers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_customers_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_customers_update_url
    assert_response :success
  end

  test "should get delete" do
    get admin_customers_delete_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_customers_destroy_url
    assert_response :success
  end

end
