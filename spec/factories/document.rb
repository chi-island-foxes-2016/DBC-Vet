FactoryGirl.define do
  factory :document do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }
    group_id 1
  end
end
