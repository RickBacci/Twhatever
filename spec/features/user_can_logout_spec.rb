require 'rails_helper'

feature "User" do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:twitter] = nil
    stub_omniauth
  end

  scenario "can logout of Twitter" do
    VCR.use_cassette("logout") do
      visit root_path

      expect(page).to_not have_link('Logout')

      click_on "Login"

      expect(page).to have_link('Logout')

      click_link "Logout"

      expect(page).to have_link('Login')
    end
  end
end
