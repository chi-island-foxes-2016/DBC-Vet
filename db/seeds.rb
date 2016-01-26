users = []
GROUP_TYPE = ["Veterinarian", "Technician", "Front Desk", "Admin"]

# make 15 employees
15.times do
  users << User.create!(username: Faker::Internet.user_name, password_digest: Faker::Internet.password)
end

# user's group type
users.each do |user|
  group = Group.create!(group_type: GROUP_TYPE.sample)
  UsersGroup.create!(user_id: user.id, group_id: group.id)
end

# create documents
group = Group.all

group