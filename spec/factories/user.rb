FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name(Faker::Name.name) }
    password { Faker::Internet.password }
  end
end
