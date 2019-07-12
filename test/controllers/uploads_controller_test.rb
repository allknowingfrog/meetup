require 'test_helper'

class UploadsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_upload_path
    assert_response :success
  end

  test "should upload user" do
    csv = fixture_file_upload('files/uploads.csv', 'text/csv')
    assert_difference('User.count') do
      post uploads_path, params: { csv: csv }
    end
    assert_redirected_to groups_url

    user = User.find_by(first_name: 'John', last_name: 'Upload')
    group = Group.find_by(name: 'Group')
    assert GroupUser.find_by(group: group, user: user).role == 'presenter'
  end
end
