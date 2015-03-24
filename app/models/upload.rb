class Upload < ActiveRecord::Base
  has_and_belongs_to_many :users
  mount_uploader :file, FileUploader
  validates :file, presence: true
  serialize :user_id
end
