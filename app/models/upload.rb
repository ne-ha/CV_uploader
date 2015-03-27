class Upload < ActiveRecord::Base
  has_and_belongs_to_many :users
  mount_uploader :file, FileUploader
  validates :file, presence: true
  serialize :shared

  def invite_by_email(params)
    if params[:upload][:user][:email].present?
      @invite_user = User.invite!(:email=>params[:upload][:user][:email])
      next_shared = Array.new
      of_email = (@invite_user.id).to_s
      next_shared = of_email
    end     
  end

  def share_by_email(params)
    if params[:commit] == 'Share'
      new_shared = Array.new
      of_email = params[:user][:user_id]
      new_shared = of_email
    end  
  end
end
