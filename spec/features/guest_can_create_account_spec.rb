require 'rails_helper'

RSpec.feature "Guest can create account", type: :feature do
  scenario "guest creates account with valid credentials" do
    visit new_user_path
    fill_in "Username", with: "Andrew"
    fill_in "Password", with: "password"
    find(:button, "Create Account").click

    expect(page).to have_content("Welcome, Andrew!")
  end
end
