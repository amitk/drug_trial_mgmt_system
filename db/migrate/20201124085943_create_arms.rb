class CreateArms < ActiveRecord::Migration[6.0]
  def change
    create_table :arms do |t|
      t.string :name
      t.integer :limit, default: 0
      t.references :clinic, foreign_key: true
      t.timestamps
    end
  end
end
