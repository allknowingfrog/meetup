require 'test_helper'

class GroupUserTest < ActiveSupport::TestCase
  test "should save if valid" do
    group_user = group_users(:default)
    assert group_user.save
  end

  test "should not duplicate" do
    group_user = group_users(:default)
    assert_raises(ActiveRecord::RecordNotUnique) { group_user.dup.save }
  end
end
