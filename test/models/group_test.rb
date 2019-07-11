require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test "should save if valid" do
    group = groups(:default)
    assert group.save
  end
end
