require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  before :each do
    visit "/users/new"
  end

  it "has a new user page" do
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
    expect(page).to have_content "Sign Up"
  end

end


  feature "logging in" do
    before :each do
      visit "/users/new"
    end

      let(:user) {FactoryGirl.build(:user)}

    it "shows username on the homepage after login" do
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_button 'Sign Up'


      expect(page).to have_content(user.username)
    end
  end

  feature "logging out" do
    before :each do
      visit "/session/new"
    end

    it "begins with logged out state" do
      expect(page).to have_content("Sign In")
    end

      let(:user) {FactoryGirl.create(:user)}

    it "doesn't show username on the homepage after logout" do
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_button 'Sign In'
      click_button 'Sign Out'
      expect(page).not_to have_content("Sign Out")
  end

end
