class PagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @avatars = Avatar.where(:user_id => current_user)
  end

  def friendindex
  	@users = User.all
  	    @friend = Friend.new

  end


end
