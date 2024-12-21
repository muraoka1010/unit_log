FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { "password" }
    nickname { "Test User" }
  end
end
