class UploadsController < ApplicationController
  def new
  end

  def create
    require 'csv'

    CSV.parse(params[:csv].read, headers: true).each do |row|
      user = User.find_or_create_by(first_name: row['First Name'],
        last_name: row['Last Name'])

      group = Group.find_or_create_by(name: row['Group Name'])

      role = row['Role in Group'].downcase
      role = 'participant' unless GroupUser.roles.keys.include?(role)

      group_user = GroupUser.find_or_initialize_by(user: user, group: group)
      group_user.role = role
      group_user.save
    end

    redirect_to groups_path, notice: 'Upload complete'
  end
end
