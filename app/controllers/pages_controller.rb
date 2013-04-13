class PagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @avatars = Avatar.where(:user_id => current_user)
      @tweets = []
    @friends = Friend.where(:primary_user_id => current_user.id)
    @friends.each do |f|
      @tweets += Tweet.where(:user_id => f.id)
    end
  end

  def friendindex
  	@users = User.all
  	    @friend = Friend.new

  end


end
