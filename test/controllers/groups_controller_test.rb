require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group = groups(:default)
  end

  test "should get index" do
    get groups_url
    assert_response :success
  end

  test "should get new" do
    get new_group_url
    assert_response :success
  end

  test "should create" do
    assert_difference('Group.count') do
      post groups_url, params: { group: { name: @group.name } }
    end
    assert_redirected_to group_url(Group.last)
  end

  test "should get show" do
    get group_url(@group)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_url(@group)
    assert_response :success
  end

  test "should update" do
    patch group_url(@group), params: { group: { name: @group.name } }
    assert_redirected_to group_url(@group)
  end

  test "should destroy" do
    assert_difference('Group.count', -1) do
      delete group_url(groups(:destroyable))
    end
    assert_redirected_to groups_url
  end
end
