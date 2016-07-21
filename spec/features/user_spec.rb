require 'rails_helper'

RSpec.feature "As a user" do
  xscenario "they can view their own index and show pages" do
    user = User.create(username: "david", password: "password")

    hammer = Tool.create(name: "Hammer", price: 1.99, quantity: 2)
    screwdriver = Tool.create(name: "Screwdriver", price: 5.50, quantity: 1)

    visit login_path

    fill_in 'session_username', with: 'david'
    fill_in 'session_password', with: 'password'

    click_on 'Login'

    expect(current_path).to eq(user_tools_path(user))
    expect(page).to have_content 'All the Tools'
    expect(page).to have_content hammer.name
    expect(page).to have_content screwdriver.price
    expect(page).to have_link 'Sign Out'
  end

  xscenario "they cannot update users besides self" do
  end

  xscenario "they can see a category show page with all associated tools" do
  end
end
