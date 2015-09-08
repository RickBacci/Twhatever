require 'rails_helper'

feature "User" do
  scenario "can authenticate with Twitter" do

    visit root_path

    click_on "Login"

    fill_in "Phone, email, or username", with: ENV['test_email']
    fill_in "Password", with: ENV['test_password']

    expect(page).to have_content('rickbacci_175')
    expect(page).to have_content('rickbacci@gmail.com')
  end
end
