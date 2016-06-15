require 'rails_helper'

RSpec.feature "Logout", type: :feature do
  scenario "user logs out" do
    user = User.create(username: "Andrew", password: "password")

    visit login_path
    fill_in "Username", with: "Andrew"
    fill_in "Password", with: "password"
    find(:button, "Login").click

    expect(current_path).to eq(user_path(user))

    within("#greeting") do
      expect(page).to have_content("Welcome, Andrew!")
    end

    find(:link, "Logout").click
    expect(page).to have_content("Login")
    expect(page).to_not have_content("Logout")
  end
end
