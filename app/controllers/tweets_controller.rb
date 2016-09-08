class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!

  def new
    @tweet = Tweet.new
  end

  def show

  end

  def index
    @t = Tweet.all
  end

  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
end
