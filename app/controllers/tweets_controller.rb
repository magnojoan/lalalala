class TweetsController < ApplicationController
	  before_filter :authenticate_user!

  def index
   @tweets = Tweet.where(:user_id => current_user.id)
  end

  def all
    @tweets = []
    @friends = Friend.where(:primary_user_id => current_user.id)
    @friends.each do |f|
      @tweets += Tweet.where(:user_id => f.id)
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(params[:tweet])
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update_attributes(params[:tweet])
      redirect_to tweets_path
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end
    
end
