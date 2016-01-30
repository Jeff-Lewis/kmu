class AddAttachmentImageToSubprojects < ActiveRecord::Migration
  def self.up
    change_table :subprojects do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :subprojects, :image
  end
end
