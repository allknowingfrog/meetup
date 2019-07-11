10.times do |x|
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.save
end

users_enum = User.all.cycle

5.times do |x|
  group = Group.new
  group.name = "#{Faker::Beer.unique.style} Enthusiasts"
  group.save

  GroupUser.roles.keys.each do |role|
    2.times do |t|
      group.group_users.create(user: users_enum.next, role: role)
    end
  end
end
