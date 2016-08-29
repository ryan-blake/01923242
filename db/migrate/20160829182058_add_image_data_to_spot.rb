class AddImageDataToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :image_data, :text
  end
end
