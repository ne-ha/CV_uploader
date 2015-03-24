class Share < ActiveRecord::Base
  belongs_to :upload
  serialize :user_id
end