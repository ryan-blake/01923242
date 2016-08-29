class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :spot, index: true, foreign_key: true
      t.string :picture
      t.string :verified
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
