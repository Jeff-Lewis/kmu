class AddAttachmentImageToWorkorders < ActiveRecord::Migration
  def self.up
    change_table :workorders do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :workorders, :image
  end
end
