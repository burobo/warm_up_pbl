FactoryBot.define do
  factory :comment do
    association :user
    association :idea
    content { Faker::Lorem.sentence }
  end
end
