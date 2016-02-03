class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userid
      t.string :password
      t.string :lastname
      t.string :name
      t.string :adress1
      t.string :adress2
      t.string :adress3
      t.string :phone1
      t.string :phone2
      t.string :org
      t.binary :image
      t.decimal :costrate
      t.string :costinfo1
      t.string :costinfo2

      t.timestamps null: false
    end
  end
end
