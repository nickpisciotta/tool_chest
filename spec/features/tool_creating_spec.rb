require 'rails_helper'

# RSpec.feature "Tool management", type: :feature do
#   scenario "user creates a new tool" do
#     #Visit a page with the form to create a new tool
#     visit new_tool_path
#     #Fill in the tools attributes: name, price, quantity
# # save_and_open_page
#     fill_in "Name", with: "Screwdriver"
#     fill_in "Price", with: 10.99
#     fill_in "tool[quantity]", with: 10
#     #Submit that form
#     find(:button, "Create Tool").click
#     # Check and see that I am on the tool show page
#     expect(current_path).to eq(tool_path(Tool.last.id))
#     #check and make sure that all the attributes I filled in and submitted are displaying on the page
#
#     within(".tool_info li:nth-child(1)") do
#       expect(page).to have_content("Screwdriver")
#     end
#
#     within(".tool_info li:nth-child(2)") do
#       expect(page).to have_content("$10.99")
#     end
# 
#     within(".tool_info li:nth-child(3)") do
#       expect(page).to have_content("InStock: 10")
#     end
#   end
# end
