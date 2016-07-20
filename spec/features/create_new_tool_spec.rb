require 'rails_helper'

xdescribe "Create new tool", :type => :feature do
  scenario "User creates a new tool" do
    visit new_tool_path

    fill_in "Name", :with => "Screwdriver"
    click_button "Create Tool"

    within(".tool_info") do
      expect(page).to have_content("Screwdriver")
    end
  end
end

xdescribe "Delete a tool", :type => :feature do
  scenario "User can delete a tool" do
    Tool.create(name: "Axe", price: 123, quantity: 1)

    visit tool_path(Tool.first)

    expect(page).to have_content("Axe")

    click_on "Delete"

    expect(current_page).to eq(tools_path)

    within(".tool_info") do
      expect(page).to have_no_content("Axe")
    end
  end
end
