class AddTermToSpots < ActiveRecord::Migration
  def change
    add_reference :spots, :term, index: true, foreign_key: true
  end
end
