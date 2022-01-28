FactoryBot.define do
  factory :doctor do
    name { Faker::Name.name }
    gender { ['Male', 'Female'].sample }
    contact_no { '7767983579' }

    factory :doctor_with_clinic do
      after(:create) do |doctor|
        create(:clinic, doctor: doctor)
      end
    end
  end
end
