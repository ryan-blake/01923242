class AddPayedToEvent < ActiveRecord::Migration
  def change
    add_column :events, :payed, :boolean, default: false
  end
end
