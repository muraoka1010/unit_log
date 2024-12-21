FactoryBot.define do
  factory :subject do
    association :user
    name { Faker::Educator.subject }
    credits { Faker::Number.between(from: 1, to: 10) }
    category { %w[必修 選択 自由].sample }
  end
end
