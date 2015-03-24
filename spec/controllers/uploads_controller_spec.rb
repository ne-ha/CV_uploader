require 'rails_helper'

describe UploadsController do 
  
  before :each do
    User.destroy_all
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
end