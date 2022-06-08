FactoryBot.define do
  factory :comment do
    user { nil }
    idea { nil }
    content { "MyText" }
  end
end
