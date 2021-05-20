# frozen_string_literal: true

class Patient < ApplicationRecord
  has_one :feedback
end
