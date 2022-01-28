FactoryBot.define do
  factory :clinic do
    name { Faker::Name.name }
    location { Faker::Nation.capital_city }

    factory :clinic_with_doctor do
      after(:create) do |clinic|
        create(:doctor, clinic: clinic)
      end
    end
  end
end
