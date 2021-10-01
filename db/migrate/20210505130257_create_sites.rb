# frozen_string_literal: true

class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :uuid
      t.string :study_uuid
      t.string :location
      t.string :phone
      t.string :email
      t.string :timezone
      t.string :address_line1
      t.string :address_line2
      t.string :state
      t.string :city
      t.string :country
      t.references :study

      t.timestamps
    end
  end
end
