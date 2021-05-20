# frozen_string_literal: true

class CreateStudies < ActiveRecord::Migration[6.0]
  def change
    create_table :studies do |t|
      t.string :uuid
      t.string :name
      t.string :drug
      t.string :sponsor

      t.timestamps
    end
  end
end
