namespace :add_records do
  desc 'Add patients to an arm of a clinic'
  task :add_patients, [:clinic, :arm, :participant_count] => [:environment] do |t, args|
    participant_count = args[:participant_count].to_i
    clinic = Clinic.find_by_name(args[:clinic])
    puts "Clinic not found" unless clinic
    arm = Arm.find_by_name(args[:arm])
    puts "Arm not found" unless arm
    puts "Arm limit is set to #{arm.limit}, won't be abled to handle #{participant_count}" if participant_count > arm.limit
    puts "Currently there are #{arm.patients.count}, Only #{arm.limit - arm.patients.count} more patients can be added" if participant_count > (arm.limit - arm.patients.count)
    (0...participant_count).each do |x|
      patient  = Patient.new(
        name: Faker::Name.name,
        contact_no: Faker::PhoneNumber.phone_number,
        age: rand(22..100),
        gender: ['male', 'female'].sample,
        arm_id: arm.id
      )
      begin
        patient.save!
      rescue StandardError => e
        puts "Unable to save patient #{e}"
      end
    end
    puts "Patients Added successfully, Total no of patients in the Arm #{arm.patients.count}"
    puts "Total no of patients in the clinic #{clinic.arms.inject"
  end 
end