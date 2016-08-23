class AddParkToSpots < ActiveRecord::Migration
  def change
    add_reference :spots, :park, index: true, foreign_key: true
  end
end
