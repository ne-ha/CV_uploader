class AddUserIdFromUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :user_id, :text
  end
end
