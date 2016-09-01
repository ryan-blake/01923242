class AddAddressToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :address, :string
    add_column :spots, :city, :string
    add_column :spots, :state, :string
    add_column :spots, :zipcode, :integer
    add_column :spots, :latitude, :float
    add_column :spots, :longitude, :float
  end
end
