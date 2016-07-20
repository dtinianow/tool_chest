require 'rails_helper'

RSpec.feature "User can login and logout" do
  xscenario "they can successfully login" do
    user = User.create(username: "david", password: "password")

    visit login_path

    fill_in 'session_username', with: 'david'
    fill_in 'session_password', with: 'password'

    click_on 'Login'

    expect(current_path).to eq(tools_path)
    within('#greeting') do
      expect(page).to have_content 'Hello, david!'
    end
  end

  xscenario "they cannot login with an incorrect password" do
    user = User.create(username: "david", password: "password")

    visit login_path

    fill_in 'session_username', with: 'david'
    fill_in 'session_password', with: 'something'

    click_on "Login"
    expect(current_path).to eq(login_path)
    expect(page).to have_content "Invalid Login!"
  end

  xscenario "they can successfully logout" do
    user = User.create(username: "david", password: "password")

    visit login_path

    fill_in 'session_username', with: 'david'
    fill_in 'session_password', with: 'password'

    click_on "Login"

    expect(page).to have_content "Hello, david!"

    click_on "Sign Out"

    expect(current_path).to eq(tools_path)
    expect(page).not_to have_content "Hello, david!"
  end
end
