class RemoveUserIdFromUploads < ActiveRecord::Migration
  def change
    remove_column :uploads, :user_id, :integer
  end
end
