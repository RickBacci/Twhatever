class User < ActiveRecord::Base

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
    user.save

    user
  end
end
