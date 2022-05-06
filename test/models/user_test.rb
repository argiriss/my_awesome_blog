require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = User.new(name: "Test", email: "test_1@test.com", image: "test.png")
    assert user.valid?
  end

  test "invalid without name" do
    user = User.new(email: "test_2@test.com", image: "test.png")
    refute user.valid?, "user is valid without a name"
    assert_not_nil user.errors[:name], "no validation error for name present"
  end

  test "invalid without email" do
    user = User.new(name: "Test", image: "test.png")
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

  test "invalid without image" do
    user = User.new(name: "Test", email: "test_3@test.com")
    refute user.valid?
    assert_not_nil user.errors[:email]
  end
end
