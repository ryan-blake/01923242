class AddPropulsionToSpot < ActiveRecord::Migration
  def change
    add_reference :spots, :propulsion, index: true, foreign_key: true
  end
end
