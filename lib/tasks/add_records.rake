# frozen_string_literal: true

namespace :add_records do
  desc 'Add patients to an arm of a clinic'
  task :add_patients, %i[clinic arm participant_count] => [:environment] do |_t, args|
    participant_count = args[:participant_count].to_i
    clinic = Clinic.find_by(name: args[:clinic])
    puts 'Clinic not found' unless clinic
    arm = Arm.find_by(name: args[:arm])
    puts 'Arm not found' unless arm
    if participant_count > arm.limit
      puts "Arm limit is set to #{arm.limit}, won't be abled to handle #{participant_count}"
    end
    if participant_count > (arm.limit - arm.patients.count)
      puts "Currently there are #{arm.patients.count}, Only #{arm.limit - arm.patients.count} more patients can be added"
    end
    (0...participant_count).each do |_x|
      patient = Patient.new(
        name: Faker::Name.name,
        contact_no: Faker::PhoneNumber.phone_number,
        age: rand(22..100),
        gender: %w[male female].sample,
        arm_id: arm.id
      )
      begin
        patient.save!
      rescue StandardError => e
        puts "Unable to save patient #{e}"
      end
    end
    puts "Patients Added successfully, Total no of patients in the Arm #{arm.patients.count}"
    puts "Total no of patients in the clinic #{clinic.arms.inject}"
  end

  desc 'Add Arms to a clinic with default limit 100 on them'
  task :add_arms, %i[clinic no_of_arms] => [:environment] do |_t, args|
    clinic = Clinic.find_by(name: args[:clinic])
    return puts 'Clinic does not exist' unless clinic

    arms_till_now = clinic.arms.last.id
    (0...args[:no_of_arms].to_i).each do |arm|
      arm = Arm.new(name: "Arm #{arm}", clinic_id: clinic.id)
      begin
        arm.save!
        puts "Arm added with name #{arm.name}"
      rescue StandardError => e
        puts "Unable to create arm reason being: #{e}"
      end
    end
  end
end
