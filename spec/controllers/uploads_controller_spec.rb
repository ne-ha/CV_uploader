require 'rails_helper'

describe UploadsController do 
  
  before :each do
    User.delete_all
    @user = FactoryGirl.create(:user)
    sign_in :user, @user
  end

  describe 'GET index' do
    context "when user is loged in " do
      it "should render index template" do
        get :index
        expect(response).to render_template("uploads/index")
      end
    end
  end

  describe 'Create resume' do
    context "when the user gives valid input " do
      it "should upload resume" do
        expect{ post :create , upload: {name: 'Anil Shah' ,
        file: Rack::Test::UploadedFile.new(File.join(Rails.root, 'public', 'uploads', 'upload', 'file', 'app-Sample_CVs.pdf'))}}.to change{Upload.count}.by(1)
        expect(flash[:notice]).to eq("The resume is uploaded.")
      end
    end

    context "when resume is nil" do
      it "should not upload resume" do
        expect{ post :create , upload: {name: 'Mila Shrestha', 
        file: nil }}.to change{Upload.count}.by(0)
        expect(flash[:notice]).to eq("Resume cannot be uploaded, re-check the fields.")
      end
    end
  end

  describe "delete action" do
    it "should delete selected resume" do
      @upload = FactoryGirl.create(:upload)
      @upload.user_id = @user.id
      @upload.save
      expect{delete :destroy , id: @upload}.to change{Upload.count}.by(-1)
      expect(flash[:notice]).to eq("Resume is deleted.")
    end
  end
end
