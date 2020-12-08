# frozen_string_literal: true

class ClinicsDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :clinics_doctors do |t|
      t.belongs_to :clinic
      t.belongs_to :doctor
    end
  end
end
