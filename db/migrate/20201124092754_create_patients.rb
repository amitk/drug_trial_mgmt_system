# frozen_string_literal: true

class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string        :name
      t.string        :contact_no
      t.string        :gender
      t.integer       :age
      t.belongs_to    :arm
      t.timestamps
    end
  end
end
