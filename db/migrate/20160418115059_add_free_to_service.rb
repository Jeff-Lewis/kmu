class AddFreeToService < ActiveRecord::Migration
  def change
    add_column :services, :free, :boolean
  end
end
