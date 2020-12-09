require 'test_helper'

class CustomerSessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_login_url
    assert_response :success
  end
end
