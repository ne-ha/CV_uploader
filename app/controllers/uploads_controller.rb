class UploadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @uploads = current_user.my_uploads
  end

  def new
    @uploads = current_user.my_uploads.new
  end

  def create
    @uploads = current_user.my_uploads.create(cv_params)
    if @uploads.save
      flash[:notice] = "The file is uploaded."
    else
      flash[:notice] = "File is not uploaded."
    end
    redirect_to(root_path)
  end

  private
  def cv_params
    params.require(:upload).permit(:name ,:file ,:user_ids => [])
  end
end
