FactoryBot.define do
  factory :graduation_requirement do
    association :user
    required_credits { 124 }
    required_core_credits { 62 }
    elective_credits { 30 }
    free_credits { 32 }
  end
end
