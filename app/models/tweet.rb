class Tweet < ActiveRecord::Base

belongs_to :user

  validates :user_id, :body, presence: true #, uniqueness: true
  validates :body,  uniqueness: true

  before_create :post_to_twitter

  def post_to_twitter
   
begin
   user.twitter.update(body) if post
rescue => e
  Rails.logger.error { "#{e.message} #{e.backtrace.join("\n")}" }
end
  end

end

