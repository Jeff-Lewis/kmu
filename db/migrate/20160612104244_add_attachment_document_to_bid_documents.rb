class AddAttachmentDocumentToBidDocuments < ActiveRecord::Migration
  def self.up
    change_table :bid_documents do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :bid_documents, :document
  end
end
