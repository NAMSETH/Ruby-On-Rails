require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD

=======
  test "should get index" do
    get transactions_index_url
    assert_response :success
  end
  test "should get new" do
    get transactions_new_path
    assert_response :success
  end
>>>>>>> 8ca7761b1c882d4b4450fa109a359c07f29be1b9
end
