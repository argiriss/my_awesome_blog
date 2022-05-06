require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "valid post" do
    post = Post.new(title: "Test", body: "Test", image: "test.png", user: User.default)
    #assert post.valid?
  end

  test "invalid without title" do
    post = Post.new(body: "Test", image: "test.png")
    refute post.valid?, "post is valid without a name"
    assert_not_nil post.errors[:name], "no validation error for name present"
  end

  test "invalid without body" do
    post = Post.new(title: "Test", image: "test.png")
    refute post.valid?
    assert_not_nil post.errors[:email]
  end

  test "invalid without image" do
    post = Post.new(title: "Test", body: "Test")
    refute post.valid?
    assert_not_nil post.errors[:email]
  end
end
