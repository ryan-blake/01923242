class AddImageUrlToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :image_url, :string
  end
end
