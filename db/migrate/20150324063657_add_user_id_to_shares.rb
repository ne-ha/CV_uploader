class AddUserIdToShares < ActiveRecord::Migration
  def change
    add_column :shares, :user_id, :text
  end
end
