class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_timeline
    @current_timeline = []
    @tweets.each do |tweet|

      @current_timeline << tweet if tweet.user_id == :user_id
    end
    @current_timeline
  end

  helper_method :current_timeline
  helper_method :current_user

end
