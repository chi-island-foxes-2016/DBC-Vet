FactoryGirl.define do
  factory :document do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }
  end
end
