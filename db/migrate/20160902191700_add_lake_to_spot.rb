class AddLakeToSpot < ActiveRecord::Migration
  def change
    add_reference :spots, :lake, index: true, foreign_key: true
  end
end
