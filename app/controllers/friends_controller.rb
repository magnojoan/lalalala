class FriendsController < ApplicationController
	  before_filter :authenticate_user!

  def index
   @friends = Friend.where(:primary_user_id => current_user.id, :approved => true)
  end

    def requests
      @friends = Friend.where(:primary_user_id => current_user.id, :approved => false)
    end

    def follow
      @friend = Friend.find(params[:id])
      @friend.approved = true
       if @friend.update_attributes(params[:friend])
      redirect_to friends_path
    end
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.create(params[:friend])
    @requester = User.find(params[:id])
    @friend.primary_user_id = current_user.id
    @friend.friend_id = requester.id
    if @friend.save
      redirect_to friends_path
    #else
      #render :new
    end
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
    redirect_to friends_path
  end
    
end
