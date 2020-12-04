require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  def setup
    @admin = AdminUser.new({email: "peter@gmail.com", password: "12345678",
        password_confirmation: "12345678"})
  end

  test "admin should be valid" do
    assert @admin.valid?
  end

  test "user with non-matching password should be invalid" do
    @admin.password = "87654321"
    assert_not @admin.valid?
  end

  test "email should be unique" do
    admin2 = @admin.dup
    @admin.save
    assert_not admin2.valid?
  end

  test "password should not be blank" do
    @admin.password = @admin.password_confirmation = " "
    assert_not @admin.valid?
  end

  test "password length should not be less than 8" do
    @admin.password = @admin.password_confirmation = "1234567"
    assert_not @admin.valid?
  end

  test "email should not be blank" do
    @admin.email = " "
    assert_not @admin.valid?
  end
end
