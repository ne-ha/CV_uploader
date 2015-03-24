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
    visit root_path
    click_link "Upload Resume"
    within(".modal-content") do
      fill_in 'upload[name]', :with => 'Usha Maharjan'
      attach_file('upload[file]',"#{Rails.root}/public/uploads/upload/file/app-Sample_CVs.pdf")
    end
      click_button "Upload"
      expect(page).to have_content "The resume is uploaded."
      visit root_path
      click_link "Remove"
      page.accept_confirm
      expect(page).to have_content "Resume is deleted."
  end
end