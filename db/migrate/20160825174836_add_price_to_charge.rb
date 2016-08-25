class AddPriceToCharge < ActiveRecord::Migration
  def change
    add_column :charges, :price, :integer
  end
end
