class AddBuyerIdToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :buyer_id, :integer
  end
end
