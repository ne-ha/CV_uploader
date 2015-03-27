require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "log in", :type=> :feature do

  before :each do
    User.delete_all
    user = FactoryGirl.create(:user)
  end

  after :each do
    Warden.test_reset!
  end

  it "should have an email" do
    user = FactoryGirl.create(:user, email:"user@example.com")
    expect(user.email).to eq("user@example.com")
  end

  it "sigin in " do
    visit "/users/sign_in"
      within("#new_user") do
      fill_in  'Email', :with => 'test@example.com'
      fill_in  'Password', :with => 'aaaaaaaa'
    end
    click_button "Sign in"
    expect(page).to have_content "Signed in successfully."
  end
end