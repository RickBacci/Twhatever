require 'rails_helper'

feature "User" do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:twitter] = nil
    stub_omniauth
  end

  scenario "can see profile info on home page" do
    VCR.use_cassette("home-profile") do
      visit root_path
      click_on "Login"

      expect(page).to have_content('JOE SMOE')
      expect(page).to have_content('me')
      expect(page).to have_content('tweets')
      expect(page).to have_content('following')
      expect(page).to have_content('followers')
    end
  end
end
