require 'test_helper'

class GroupUserTest < ActiveSupport::TestCase
  test "should save if valid" do
    group_user = group_users(:default)
    assert group_user.save
  end
end
