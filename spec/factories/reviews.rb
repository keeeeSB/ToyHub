FactoryBot.define do
  factory :review do
    comment { "MyString" }
    rating { "MyString" }
    user { nil }
    toy { nil }
  end
end
