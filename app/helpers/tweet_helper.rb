module TweetHelper

  def tweet_time(time)
    time_ago_in_words(time)
  end

  def user_tweets_count
    if cache_empty?('tweet_count')
      Rails.cache.write('tweet_count', client.user.tweets_count, expires_in: 2.minutes)
    end
    Rails.cache.fetch('tweet_count')
  end


  def home_timeline
    if cache_empty?('home_timeline')
      Rails.cache.write('home_timeline', client.home_timeline, expires_in: 2.minutes)
    end
    Rails.cache.fetch('home_timeline')
  end

  private

  def cache_empty?(key)
    Rails.cache.fetch(key).nil?
  end

  def client
    current_user.twitter_client
  end
end
