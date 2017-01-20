ENV["confirmable"] = "false" # <<<----- have you seen this?

require 'rails_helper'

RSpec.feature "Registering without confirmation" do
  before :each do
    @email = "alien@example.com"
    @pwd   = "axD4YuiN6F"
  end


  scenario "A user is signing up" do
    visit "/"
    click_link "Sign up"

    fill_in "Email", with: @email
    fill_in "Password", with: @pwd
    fill_in "Password confirmation", with: @pwd
    check "I accept Terms of Service and Privacy Policy"

    click_button "Register now"
    expect(page).to have_content("You have signed up successfully")

    fill_in "First name", with: "Jason"
    fill_in "Last name", with: "Alien"
    fill_in "Notes", with: "My little note"

    click_button "Update"

    expect(page).to have_content("User was successfully updated")
    expect(page.current_path).to eq(dashboard_path)
  end



  scenario "Sign up fail because terms are not accepted" do
    visit "/"
    click_link "Sign up"

    fill_in "Email", with: @email
    fill_in "Password", with: @pwd
    fill_in "Password confirmation", with: @pwd

    click_button "Register now"
    expect(page).to have_content("Terms of Service and Privacy Policy must be accepted")
  end



  scenario "Sign up fail because user is already registered" do
    a = Account.create(email: @email, password: @pwd, password_confirmation: @pwd, tos_and_pp: true)

    visit "/"
    click_link "Sign up"

    fill_in "Email", with: @email
    fill_in "Password", with: @pwd
    fill_in "Password confirmation", with: @pwd
    check "I accept Terms of Service and Privacy Policy"

    click_button "Register now"
    expect(page).to have_content("Email has already been taken")
  end


  scenario "Sign up fail because email is not valid" do
    visit "/"
    click_link "Sign up"

    fill_in "Email", with: "alien@example"
    fill_in "Password", with: @pwd
    fill_in "Password confirmation", with: @pwd
    check "I accept Terms of Service and Privacy Policy"

    click_button "Register now"
    expect(page).to have_content("Email is invalid")
  end


  scenario "Sign up fail because email confirmation don't match email" do
    visit "/"
    click_link "Sign up"

    fill_in "Email", with: @email
    fill_in "Password", with: @pwd
    fill_in "Password confirmation", with: "another_pwd"
    check "I accept Terms of Service and Privacy Policy"

    click_button "Register now"
    expect(page).to have_content("Password confirmation doesn't match")
  end
end