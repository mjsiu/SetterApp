require 'rails_helper'



  feature "User can use associations" do

    before(:each) do
      sign_up("Jeff")
    end

    it "can add new comment" do
      fill_in "Body", with: "Back"
      fill_in "Title", with: "Hello!"
      click_button "New Comment"
      expect(page).to have_content "Back"
    end

  end
