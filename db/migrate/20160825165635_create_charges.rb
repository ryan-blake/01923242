class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :item
      t.integer :user_id
      t.integer :vendor_id
      t.string :token
      t.string :customer_id
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
