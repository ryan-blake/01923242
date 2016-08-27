class AddStripeUserIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :stripe_user_id, :string
  end
end
