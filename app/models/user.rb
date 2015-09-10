class User < ActiveRecord::Base
  attr_reader :client

  def self.find_or_create_from_oauth(oauth)
    user = User.find_or_create_by(provider: oauth['provider'],
                                  uid: oauth['uid'])

    user.provider    = oauth['provider']
    user.uid         = oauth['uid']
    user.nickname    = oauth['info']['nickname']
    user.name        = oauth['info']['name']
    user.location    = oauth['info']['location']
    user.image       = oauth['info']['image']
    user.description = oauth['info']['description']
    user.token       = oauth['credentials']['token']
    user.secret      = oauth['credentials']['secret']
    user.save

    user
  end

  def twitter_client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_client']
      config.consumer_secret     = ENV['twitter_secret']
      config.access_token        = token
      config.access_token_secret = secret
    end
    client
  end
end
