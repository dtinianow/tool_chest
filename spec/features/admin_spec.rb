require 'rails_helper'
require 'mocha/mini_test'

RSpec.feature "As an admin" do
  scenario "they can see all the tools and visit an individual tool page" do

    admin = User.create!(username: "david", password: "password", role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit login_path

    fill_in 'session_username', with: 'david'
    fill_in 'session_password', with: 'password'

    click_on 'Login'
    cat = Category.create(name: "Stuff")
    admin.tools.create!(name: "Hammer", price: 1.99, quantity: 2, category_id: cat.id)
    admin.tools.create!(name: "Saw", price: 5.50, quantity: 1, category_id: cat.id)

    expect(current_path).to eq(admin_tools_path)
    expect(page).to have_content 'All the Tools'
    expect(page).to have_content "Hammer"
    expect(page).to have_content "5.50"
    expect(page).to have_link 'Sign Out'
  end

  scenario "a created tool must be assigned to a default user" do
  end

  scenario "they cannot update users besides self" do
  end

  scenario "they can crud categories" do
  end

end
