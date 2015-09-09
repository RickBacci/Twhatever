require 'rails_helper'

feature "User" do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:twitter] = nil
    OmniAuth.config.test_mode = true
    # request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
    # Capybara.app = TwitterClone::Application
    stub_omniauth

  end

  scenario "can authenticate with Twitter" do

    visit root_path

    expect(page).to_not have_link('Logout')

    click_on "Login"

    expect(page).to have_link('Logout')
  end
end
