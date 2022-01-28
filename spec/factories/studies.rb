FactoryBot.define do
  factory :study do
    uuid { SecureRandom.uuid }
    name { Faker::Name.name }
    drug { Faker::Ancient.primordial }
    sponsor { Faker::Ancient.hero }
  end
end
