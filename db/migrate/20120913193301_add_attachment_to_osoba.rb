class AddAttachmentToOsoba < ActiveRecord::Migration
 def change
    add_attachment :osoby, :avatar
  end
end
