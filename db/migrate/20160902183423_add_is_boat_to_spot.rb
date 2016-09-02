class AddIsBoatToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :is_boat, :boolean
  end
end
