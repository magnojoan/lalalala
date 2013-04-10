class PagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @avatars = Avatar.where(:user_id => current_user)
  end

end
