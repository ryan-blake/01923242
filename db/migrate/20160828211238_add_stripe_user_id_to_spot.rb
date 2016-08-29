class AddStripeUserIdToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :stripe_user_id, :integer
  end
end
