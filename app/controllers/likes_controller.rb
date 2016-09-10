class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.likes.where(user_id: current_user.id).first_or_create
      redirect_to request.referrer, notice: "You've liked this tweet!"
  end
end
