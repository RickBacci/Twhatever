require 'rails_helper'

feature "User" do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:twitter] = nil
    stub_omniauth
  end

  scenario "can visit profile page" do
    VCR.use_cassette("visit_profile") do
      visit root_path
      click_on "Login"
      find(".nav-pic").click

      expect(page).to have_content('Home')
    end
  end
end
