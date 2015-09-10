require 'rails_helper'

feature "User" do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:twitter] = nil
    stub_omniauth
  end

  scenario "can see a list of recent tweets from their feed" do
    VCR.use_cassette("view_tweets") do
      visit root_path
      click_on "Login"

      expect(page).to have_content('What\'s happening?')
    end
  end
end
