class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :title
      t.string :description
      t.integer :length
      t.integer :width
      t.integer :depth

      t.timestamps null: false
    end
  end
end
