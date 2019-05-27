class FeedController < ApplicationController
  def index
  	@profile = Profile.find(current_user.id)
  end
end
