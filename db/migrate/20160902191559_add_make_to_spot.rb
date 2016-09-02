class AddMakeToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :make, :text
  end
end
