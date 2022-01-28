# frozen_string_literal: true

class Arm < ApplicationRecord
  belongs_to :clinic
  has_many :patients

  validates :name, :limit, presence: true
end
