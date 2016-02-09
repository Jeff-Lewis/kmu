class RemoveFieldNameFromTimetrack < ActiveRecord::Migration
  def change
    remove_column :timetracks, :hour_or_cost, :string
  end
end
