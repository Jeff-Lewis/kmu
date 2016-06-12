class CreateBidDocuments < ActiveRecord::Migration
  def change
    create_table :bid_documents do |t|
      t.integer :bid_id
      t.integer :company_id
      t.string :name
      t.text :description
      t.string :status

      t.timestamps null: false
    end
  end
end
