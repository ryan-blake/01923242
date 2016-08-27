class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :item
      t.integer :price
      t.references :user, index: true, foreign_key: true
      t.integer :vendor_id
      t.string :token
      t.string :customer_id
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
