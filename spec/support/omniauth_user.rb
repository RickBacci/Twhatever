module OmniAuthUser

  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
      {
        provider: 'twitter',
        uid:      ENV['uid'],
        info: {
          nickname:    "me",
          name:        "JOE SMOE",
          location:    "Home",
          image:       "pic.jpg",
          description: "Description",
        },
        credentials: {
          token: ENV['test_token']
        }
      })
  end
end
