class Clinic < ApplicationRecord

  has_many :arms
  has_and_belongs_to_many :doctors
end
