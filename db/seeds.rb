users = []
groups = []
GROUP_TYPE = ["Veterinarian", "Technician", "Front Desk"]

GROUP_TYPE.each do |type|
  groups << Group.create!(group_type: type)
end

# make 15 employees
15.times do |x|
  if x > 13
    users << User.create!(username: Faker::Internet.user_name, password_digest: Faker::Internet.password, admin: true)
  else
    users << User.create!(username: Faker::Internet.user_name, password_digest: Faker::Internet.password, admin: false)
  end
end

# user's group type
users.each do |user|
  user.groups << groups.sample
  # UsersGroup.create!(user_id: user.id, group_id: group.id)
end

# create documents
# groups = Group.all

groups.each do |group|
  doc = Document.create!(title: Faker::Lorem.word, content: Faker::Lorem.paragraph, group_id: group.id)
  DocumentsGroup.create(document_id: doc.id, group_id: group.id)
end