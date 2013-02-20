class TweetsController < ApplicationController
  
  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    if @tweet = Tweet.where(id: params[:tweet][:id]).first
      redirect_to @tweet
    elsif @tweet = Tweet.fetch_tweet(params[:tweet][:id])
      redirect_to @tweet
    else
      @tweet = Tweet.new
      @notice = "Tweet Unavailable."
      render "new"
    end
  end

end
