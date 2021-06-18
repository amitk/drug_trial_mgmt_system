# frozen_string_literal: true

class Patient < ApplicationRecord
  has_one :feedback
  belongs_to :arm

  validate :patient_limit, if: :new_record?

  def patient_limit
    errors.add(:base, "Cannot add more patients to the given arm, it's limit is #{arm.limit}") if arm.patients.count == arm.limit
  end
end
