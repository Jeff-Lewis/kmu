class CreateTimetracks < ActiveRecord::Migration
  def change
    create_table :timetracks do |t|
      t.integer :user_id
      t.integer :workorder_id
      t.string :hour_or_cost
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
