class UploadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @uploads = Kaminari.paginate_array(current_user.my_uploads.order('created_at desc')).page(params[:page]).per(5)
    #filtering serialized data shared
    @shared = Kaminari.paginate_array(Upload.all.select{|u| u.shared && u.shared.include?(current_user.id.to_s)}).page(params[:page]).per(5)
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
    shared_ids = Array.new
    if params[:upload][:user][:email].present?
      @invite_user = User.invite!(:email=>params[:upload][:user][:email])
      shared_ids << @invite_user.id
      
      # if params[:commit] == 'Share'
      #   binding.pry
      #   new_shared_ids = params[:user][:user_id]
      #   old_shared_ids = @upload.shared
      #   @upload.shared = old_shared_ids + new_shared_ids
      #   @upload.save
      #   flash[:notice] = "Resume is shared to other users."
      # else
      #   flash[:notice] = "Resume cannot be shared to other users."
      # end
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

  def user_params
    params.require(:user).permit(:email)
  end
end
