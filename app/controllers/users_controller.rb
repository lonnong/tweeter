class UsersController < ApplicationController


 def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    Tweet.destroy_all
    @user.twitter.home_timeline.each do |tweet|
      @user.build_tweet(tweet.text, @user.id)
    end
    redirect_to root_path
  end

def post
#  @user = User.find_or_create_from_auth_hash(auth_hash)
  @user.post_tweet("message")
end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end

