class AddArrivedToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :arrived, :boolean
  end
end
