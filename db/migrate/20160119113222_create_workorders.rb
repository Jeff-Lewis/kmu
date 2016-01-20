class CreateWorkorders < ActiveRecord::Migration
  def change
    create_table :workorders do |t|
      t.integer :subproject_id
      t.integer :user_id
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
