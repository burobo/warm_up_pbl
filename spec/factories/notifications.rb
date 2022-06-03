FactoryBot.define do
  factory :notification do
     # eventは Notification.events[:favorited] 等で指定可能
    event { nil }
    checked { false }
    favorite { nil }
    user { nil }
  end
end
