require 'rails_helper'

RSpec.feature "User can edit profile", type: :feature do
  scenario "user can change username" do
    user = User.create(username: "npisciotta", password: "password")

    visit login_path
    fill_in "Username", with: "npisciotta"
    fill_in "Password", with: "password"
    find(:button, "Login").click

    expect(page).to have_content("Welcome, npisciotta!")

    find(:link, "Edit user").click
    fill_in "Username", with: "nickpisciotta"
    fill_in "Password", with: "password"
    find(:button, "Update User").click

    expect(page).to have_content("Welcome, nickpisciotta!")
  end
end
