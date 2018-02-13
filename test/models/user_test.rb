require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "avatar url" do
    endpoint = "#{ENV['S3_REDIRECT_ENDPOINT']}/#{50}x#{50}/uploads/random/hi.jpg"
    assert_equal @user.avatar_url('50'), endpoint
  end
end
