require 'rails_helper'

feature "User" do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:twitter] = nil
    stub_omniauth
  end
  describe "can iteract with tweets" do
    scenario "by creating a tweet" do


      VCR.use_cassette("use_tweets") do
        visit root_path
        click_on "Login"

        expect(page).to_not have_content('Test Tweet!')
        within('#tweet-form') { fill_in 'tweet', with: 'Test Tweet!' }
        click_on "Tweet"

        expect(page).to have_content('Tweet sent!')

        VCR.use_cassette("favorite_tweet") do

          first('.fav-tweet').click

          expect(page).to have_content('Tweet favorited!')
        end
      end
    end
  end
end
