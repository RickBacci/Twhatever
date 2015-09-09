Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,
           ENV['twitter_client'],
           ENV['twitter_secret']
end
