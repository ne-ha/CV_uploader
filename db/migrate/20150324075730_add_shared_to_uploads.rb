class AddSharedToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :shared, :text
  end
end
