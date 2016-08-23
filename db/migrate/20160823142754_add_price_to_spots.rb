class AddPriceToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :price, :integer
    add_reference :spots, :user, index: true, foreign_key: true
  end
end
