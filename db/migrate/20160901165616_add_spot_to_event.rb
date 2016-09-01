class AddSpotToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :spot, index: true, foreign_key: true
  end
end
