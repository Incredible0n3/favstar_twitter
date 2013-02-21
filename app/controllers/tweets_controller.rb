class TweetsController < ApplicationController
  
  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params[:tweet])

    if @tweet.valid?
      if tweet = Tweet.where(tweet_id: @tweet.tweet_id).first
        redirect_to tweet
      elsif @tweet.fetch_tweet_status
        if @tweet.save
          redirect_to @tweet
        else
          @tweet.errors[:base] << "Tweet could not be stored."
          render "new"
        end
      else
        @tweet.errors[:base] << "Tweet Unavailable"
        render "new"
      end
    else
      render "new"
    end
  end

end
