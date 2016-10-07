class CreateUserPositions < ActiveRecord::Migration
  def change
    create_table :user_positions do |t|
      t.integer :user_id
      t.float :latitude
      t.float :longitude
      t.string :geo_address

      t.timestamps null: false
    end
  end
end
