class AddChargeToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :charge, index: true, foreign_key: true
  end
end
