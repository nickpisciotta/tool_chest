require 'rails_helper'

RSpec.feature "User sees their tools", type: :feature do
  scenario "logged in user sees tools they create" do
    user1 = User.create(username: "npisciotta", password: "password")
    tool1 = user1.tools.create(name: "hammer", price: 10, quantity:10)
    user2 = User.create(username: "nickpisciotta", password: "password1")
    tool2 = user2.tools.create(name: "screwdriver", price: 10, quantity:10)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit tools_path

    expect(page).to have_content(tool1.name)
    expect(page).to_not have_content(tool2.name)
  end
end
