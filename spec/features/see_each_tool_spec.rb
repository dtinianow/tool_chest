require 'rails_helper'

xdescribe "See each tool", :type => :feature do
  scenario "User creates new tool and sees them on home page" do
    visit tools_path
    within(".list_of_tools") do
      expect(page).to_not have_content("Screwdriver")
    end
    click_link("Create New Tool")

    within(".tool_form") do
      fill_in "Name", with: "Screwdriver"
      fill_in "Quantity", with: 1
      fill_in "Price", with: 1.99
    end
    click_button("Create Tool")

    expect(current_path).to eq(tool_path(Tool.last))
    click_link "Return Home"

    within(".list_of_tools") do
      expect(page).to have_content("Screwdriver")
      expect(page).to have_content(1)
      expect(page).to have_content("1.99")
    end
  end
end
