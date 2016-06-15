require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "registered user logs in with valid credentials" do
    user = User.create(username: "Andrew", password: "password")

    visit login_path
    fill_in "Username", with: "Andrew"
    fill_in "Password", with: "password"
    find(:button, "Login").click

    expect(current_path).to eq(user_path(user))

    within("#greeting") do
      expect(page).to have_content("Welcome, Andrew!")
    end
  end
end
