FactoryBot.define do
  factory :idea do
    title { "MyText" }
    outline { "MyText" }
    detail { "MyText" }
    user
  end
end
