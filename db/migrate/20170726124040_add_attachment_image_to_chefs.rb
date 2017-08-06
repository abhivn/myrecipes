class AddAttachmentImageToChefs < ActiveRecord::Migration
  def self.up
    change_table :chefs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :chefs, :image
  end
end
