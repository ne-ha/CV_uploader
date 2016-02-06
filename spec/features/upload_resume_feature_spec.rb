require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "user", :type=> :feature, :js => true do

  before :each do
    User.delete_all
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  after :each do
    Warden.test_reset!
  end

  it "should be able to delete resume" do
    sleep 2
    visit root_path
    sleep 2
    click_link "Upload Resume"
    sleep 2
    within(".modal-content") do
      fill_in 'upload[name]', :with => 'Usha Maharjan'
      attach_file('upload[file]',"#{Rails.root}/public/uploads/upload/file/app-Sample_CVs.pdf")
    end
      sleep 2
      click_button "Upload"
      sleep 2
      expect(page).to have_content "The resume is uploaded."
  end
end