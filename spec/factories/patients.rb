FactoryBot.define do
  factory :patient do
    name { Faker::Name.name }
    contact_no { '7767983579' }
    gender { ['Male', 'Female' ].sample }
    age { Faker::Number.between(from: 20, to: 40) }

    association :arm, factory: :arm
  end
end
