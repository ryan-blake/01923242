class CreatePropulsions < ActiveRecord::Migration
  def change
    create_table :propulsions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
