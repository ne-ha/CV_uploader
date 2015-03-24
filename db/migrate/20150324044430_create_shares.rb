class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :share_to
    end
  end
end
