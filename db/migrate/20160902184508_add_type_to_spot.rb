class AddTypeToSpot < ActiveRecord::Migration
  def change
    add_reference :spots, :type, index: true, foreign_key: true
  end
end
