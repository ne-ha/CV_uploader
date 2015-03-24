class AddUploadIdToShares < ActiveRecord::Migration
  def change
    add_column :shares, :upload_id, :integer
  end
end
