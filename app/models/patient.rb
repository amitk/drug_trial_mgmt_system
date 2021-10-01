# frozen_string_literal: true

class Patient < ApplicationRecord
  belongs_to :arm

  validate :patient_limit, if: :new_record?

  def patient_limit
    return unless arm.patients.count == arm.limit

    errors.add(:base,
               "Cannot add more patients to the given arm, it's limit is #{arm.limit}")
  end
end
