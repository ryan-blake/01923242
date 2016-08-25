class AddCoverToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :covered, :boolean
    add_column :spots, :ramp, :integer
  end
end
