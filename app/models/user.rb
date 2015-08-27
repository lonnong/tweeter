class User < ActiveRecord::Base
  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
      name: auth_hash.info.nickname,
      token: auth_hash.credentials.token,
      secret: auth_hash.credentials.secret
    )
#    user.twitter.home_timeline.each do |tweet|
#       user.create_tweet(tweet.text, user.id)
#    end
    user
  end

  def twitter
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
      config.access_token        = token
      config.access_token_secret = secret
    end
  end

def create_tweet(body, user_id)
  p body
  t= Tweet.new
  t.body = body
  t.user_id = user_id
  t.save
end

#  raise :test
#  @client.lists.each do |list|
  # Get the timeline with the list ID
#    @client.home_timeline.each do |tweet|
#    puts tweet.text
#  end

end

