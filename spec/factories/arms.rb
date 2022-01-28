FactoryBot.define do
  factory :arm do
    name { Faker::Name.name }
    limit { Faker::Number.between(from: 5, to: 10)}
    
    association :clinic, factory: :clinic
  end
end
