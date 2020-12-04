require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/accounts/index'
    assert_response :success
  end

  test "should get new" do
    get '/accounts/new'
    assert_response :success
  end



end
