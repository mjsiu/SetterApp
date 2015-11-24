
require 'rails_helper'

feature "Can create new goal" do
  before(:each) do
    sign_up("Jack")
  end

  it "has a create goal button" do
    expect(page).to have_button "Create Goal"
  end

  it "goes to the right action" do
    click_button "Create Goal"

    expect(page).to have_content "Title"
    expect(page).to have_content "Body"
    expect(page).to have_content "Visibility"
  end

  it "validates goal creation" do
    click_button "Create Goal"
    click_button "submit"

    expect(page).to have_content "Title can't be blank Body can't be blank"
  end

  it "sucessfully creates a goal" do
    click_button "Create Goal"
    fill_in "Title", with: "The Best Title"
    fill_in "Body", with: "Coolest Body"
    select('Private', :from => 'Visibility')
    click_button "submit"

    expect(page).to have_content "Goals"
end

end

feature "Can Complete Goal" do

  before(:each) do
    sign_up("Jack")
  end


  it "shows goal completed after click" do
    click_button "Create Goal"
    fill_in "Title", with: "The Best Title"
    fill_in "Body", with: "Coolest Body"
    select('Private', :from => 'Visibility')
    click_button "submit"

    click_link "The Best Title"
    click_button "Complete Goal"
    expect(page).to have_content "Goal Completed!"
  end

end
