class Tweet < ActiveRecord::Base
  attr_accessible :status
  attr_accessible :tweet_id
  validates :tweet_id, :presence => true
  validates_numericality_of :tweet_id, :only_integer => true, :greater_than => 0, :message => "must be a valid whole number."

  def fetch_tweet_status
    self.status = Twitter.status(self.tweet_id).text
    true
  rescue 
    false
  end
end
