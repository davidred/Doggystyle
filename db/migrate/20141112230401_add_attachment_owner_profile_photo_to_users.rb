class AddAttachmentOwnerProfilePhotoToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :owner_profile_photo
    end
  end

  def self.down
    remove_attachment :users, :owner_profile_photo
  end
end
