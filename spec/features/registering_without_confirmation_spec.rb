ENV["confirmable"] = "false" # <<<----- have you seen this?

require 'rails_helper'

RSpec.feature "Registering without confirmation" do
  scenario "A user is signing up" do
    visit "/"
    click_link "Sign up"

    fill_in "Email", with: "alien@example.com"
    fill_in "Password", with: "axD4YuiN6F"
    fill_in "Password confirmation", with: "axD4YuiN6F"

    click_button "Register now"
    expect(page).to have_content("You have signed up successfully")

    fill_in "First name", with: "Jason"
    fill_in "Last name", with: "Alien"
    fill_in "Notes", with: "My little note"

    click_button "Update"

    expect(page).to have_content("User was successfully updated")
    expect(page.current_path).to eq(dashboard_path)
  end
end