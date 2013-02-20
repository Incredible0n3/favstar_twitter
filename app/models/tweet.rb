class Tweet < ActiveRecord::Base
  attr_accessible :status

  def self.fetch_tweet(id)
    Tweet.create(:id => id, :status => Twitter.status(id).text )
  rescue
    nil
  end
end
