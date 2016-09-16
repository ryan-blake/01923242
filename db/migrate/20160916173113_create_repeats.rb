class CreateRepeats < ActiveRecord::Migration
  def change
    create_table :repeats do |t|
      t.belongs_to :event, index: true
      t.string :title
      t.string :tag
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps null: false
    end
  end
end
