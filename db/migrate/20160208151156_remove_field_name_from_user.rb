class RemoveFieldNameFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :responsibility, :string
  end
end
