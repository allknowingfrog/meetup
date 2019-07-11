require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should save if valid" do
    user = users(:default)
    assert user.save
  end
end
