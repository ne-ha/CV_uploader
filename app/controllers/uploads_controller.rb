class UploadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @uploads = current_user.my_uploads
    #filtering serialized data shared
    @shared = Upload.all.select{|u| u.shared && u.shared.include?(current_user.id.to_s)}
  end

  def new
    @upload = current_user.my_uploads.new
  end

  def create
    @upload = current_user.my_uploads.create(cv_params)
    if @upload.save
      flash[:notice] = "The resume is uploaded."
    else
      flash[:notice] = "Resume cannot be uploaded, re-check the fields."
    end
    redirect_to(root_path)
  end

  def destroy
    @upload = current_user.my_uploads.find(params[:id])
    if @upload.delete
      flash[:notice] = "Resume is deleted."
    else
      flash[:notice] = "The resume cannot be deleted."
    end
    redirect_to(root_path)
  end

  def update
    @upload = current_user.my_uploads.find(params[:id])
    if params[:commit] == 'Share'
      @upload.shared = params[:user][:user_id]
      @upload.save
      flash[:notice] = "Resume is shared to other users."
    else
      flash[:notice] = "Resume cannot be shared to other users."
    end
    redirect_to(root_path)
  end  

  def share_resume
    @upload = Upload.find(params[:upload_id])
  end

  private
  def cv_params
    params.require(:upload).permit(:name ,:file, :shared=>[])
  end
end
