FactoryBot.define do
  factory :user do
    name { "けいすけ" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "password" }
    password_confirmation{ "password" }
    bio { "よろしくお願いします。" }
    activated { true }
    activated_at { Time.current }
  end
end
