# frozen_string_literal: true

class AddFeedbackFieldToPatient < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :feedback, :string
  end
end
