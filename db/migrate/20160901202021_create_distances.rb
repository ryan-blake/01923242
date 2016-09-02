class CreateDistances < ActiveRecord::Migration
  def change
    create_table :distances do |t|
      t.integer :value
      t.references :spot, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
