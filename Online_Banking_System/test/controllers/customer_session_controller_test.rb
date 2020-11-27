require 'test_helper'

class CustomerSessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_session_new_url
    assert_response :success
  end

end
