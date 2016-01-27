class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.integer :user_id
      t.integer :workorder_id
      t.boolean :access
      t.decimal :costrate

      t.timestamps null: false
    end
  end
end
