require 'rails_helper'

feature "Can use associations" do


  feature "User can use associations" do

    before(:each) do
      sign_up("Jeff")
    end

    it "can add new comment" do
      fill_in "Body", with: "Back"
      click_button "New Comment"
      expect(page).to have_content "Back"
    end

  end
