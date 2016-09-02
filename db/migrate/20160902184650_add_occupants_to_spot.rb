class AddOccupantsToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :occupants, :integer
  end
end
