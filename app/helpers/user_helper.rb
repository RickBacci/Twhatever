module UserHelper

  def user_screen_name
    if cache_empty?('screen_name')
      Rails.cache.write('screen_name', "@#{client.user.screen_name}", expires_in: 2.minutes)
      Rails.cache.fetch('screen_name')
    end
  end

  def user_friends_count
    if cache_empty?('friends_count')
      Rails.cache.write('friends_count', client.user.friends_count, expires_in: 2.minutes)
    end
    Rails.cache.fetch('friends_count')
  end

  def user_followers_count
    if cache_empty?('followers_count')
      Rails.cache.write('followers_count', client.user.followers_count, expires_in: 2.minutes)
    end
    Rails.cache.fetch('followers_count')
  end


  def user_timeline
    if cache_empty?('user_timeline')
      Rails.cache.write('user_timeline', client.user_timeline, expires_in: 2.minutes)
    end
    Rails.cache.fetch('user_timeline')
  end

  def user_description
    if cache_empty?('user_description')
      Rails.cache.write('user_description', client.user.description, expires_in: 15.minutes)
    end
    Rails.cache.fetch('user_description')
  end

  def user_location
    if cache_empty?('user_location')
      Rails.cache.write('user_location', client.user.location, expires_in: 15.minutes)
    end
    Rails.cache.fetch('user_location')
  end

  private

  def cache_empty?(key)
    Rails.cache.fetch(key).nil?
  end

  def client
    current_user.twitter_client
  end
end
