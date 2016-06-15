require 'rails_helper'

RSpec.feature "Views most recent tool", type: :feature do
  scenario "after creating a tool, recent tool is displayed" do
    user = User.create(username: "Andrew", password: "password")

    visit login_path
    fill_in "Username", with: "Andrew"
    fill_in "Password", with: "password"
    find(:button, "Login").click

    expect(page).to have_content("Welcome, Andrew!")

    find(:link, "Create tool").click
    fill_in "Name", with: "hammer"
    fill_in "Price", with: 10
    fill_in "Quantity", with: 10
    select "Power Tools", :from => "Category"
    find(:button, "Create Tool").click

    expect(page).to have_content("Newest tool: hammer")

    find(:link, "All tools").click
    find(:link, "New tool").click
    fill_in "Name", with: "screwdriver"
    fill_in "Price", with: 10
    fill_in "Quantity", with: 10
    select "Power Tools", :from => "Category"
    find(:button, "Create Tool").click

    expect(page).to have_content("Newest tool: screwdriver")

  end
end
