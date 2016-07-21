class CreatePartnerLinks < ActiveRecord::Migration
  def change
    create_table :partner_links do |t|
      t.integer :company_id
      t.string :name
      t.text :description
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at
      t.boolean :active
      t.string :link

      t.timestamps null: false
    end
  end
end
