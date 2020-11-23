class Doctor < ApplicationRecord

  validates :name, :contact_no, :gender, presence: true
  validates :contact_no, length: { is: 10 }
  validates :contact_no, format: { with: /\A[7-9][0-9]{9}\z/, message: 'Contact no should start from 7-9' }
end
