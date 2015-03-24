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
      flash[:notice] = "File cannot be uploaded, re-check the fields."
    end
    redirect_to(root_path)
  end

  def destroy
    @upload = current_user.my_uploads.find(params[:id])
    if @upload.destroy
      flash[:notice] = "Resume is delete."
    else
      flash[:notice] = "The file cannot be deleted."
    end
    redirect_to(root_path)
  end

  def share_resume
    @upload = Upload.find(params[:upload_id])
  end

  private
  def cv_params
    params.require(:upload).permit(:name ,:file ,:user_ids => [])
  end
end
