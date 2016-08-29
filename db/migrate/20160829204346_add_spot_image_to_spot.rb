class AddSpotImageToSpot < ActiveRecord::Migration
  def change
    add_attachment :spots, :spot_image
  end
end
