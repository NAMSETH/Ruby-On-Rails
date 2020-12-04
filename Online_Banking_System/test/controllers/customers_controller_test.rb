require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get new_customer_path
    assert_response :success
  end

end
