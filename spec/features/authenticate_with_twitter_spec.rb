require 'rails_helper'

feature "User" do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:twitter] = nil
    OmniAuth.config.test_mode = true
    stub_omniauth

  end

  scenario "can authenticate with Twitter" do
    VCR.use_cassette("authenticate") do
      visit root_path

      expect(page).to_not have_link('Logout')

      click_on "Login"


      expect(page).to have_link('Logout')
    end
  end
end
