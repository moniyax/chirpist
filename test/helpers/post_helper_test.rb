class PostHelperTest < ActionView::TestCase
  test "action icon color" do
    user_one = users(:one, "red")

    assert_equal(action_icon_color(:like, user_one, post_one), "color: 'red'")
  end
end