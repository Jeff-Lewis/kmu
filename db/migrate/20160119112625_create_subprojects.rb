class CreateSubprojects < ActiveRecord::Migration
  def change
    create_table :subprojects do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
