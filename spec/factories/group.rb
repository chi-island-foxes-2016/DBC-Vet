FactoryGirl.define do
  factory :group do
    group_type { Faker::Company.profession }
  end
end
