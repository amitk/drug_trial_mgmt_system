# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @clinics = Clinic.count
  end
end
