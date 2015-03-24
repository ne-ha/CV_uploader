class RemoveShareToFromShares < ActiveRecord::Migration
  def change
    remove_column :shares, :share_to, :string
  end
end
