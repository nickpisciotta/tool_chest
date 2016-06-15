require 'rails_helper'

RSpec.feature "User sees all their tools", type: :feature do
  scenario "logged in user sees all tools" do
    user = User.create(username: "npisciotta", password: "password")
    tool1 = user.tools.create(name: "hammer", price: 10, quantity:10)
    tool2 =  user.tools.create(name: "screwdriver", price: 10, quantity:10)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit tools_path

    expect(page).to have_content(tool1.name)
    expect(page).to have_content(tool2.name)
  end

  scenario "user can access show page from all tools list" do
    user = User.create(username: "npisciotta", password: "password")
    tool1 = user.tools.create(name: "hammer", price: 10, quantity:10)
    tool2 =  user.tools.create(name: "screwdriver", price: 10, quantity:10)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit tools_path

    find(:link, "hammer").click

    expect(page).to have_content("hammer")
    expect(page).to have_content("$10.0")
    expect(page).to have_content("InStock: 10")
  end 

end
