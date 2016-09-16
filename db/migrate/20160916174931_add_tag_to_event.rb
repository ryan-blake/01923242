class AddTagToEvent < ActiveRecord::Migration
  def change
    add_column :events, :tag, :string
    add_column :events, :repeat, :string
  end
end
