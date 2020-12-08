# frozen_string_literal: true

class CreateClinics < ActiveRecord::Migration[6.0]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
