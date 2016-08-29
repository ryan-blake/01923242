class AddStripeUserIdToCharge < ActiveRecord::Migration
  def change
    add_column :charges, :stripe_user_id, :integer
  end
end
