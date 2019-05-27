class FeedController < ApplicationController
  def index
  	@profile = Profile.find(current_user.id)
  	@connection_requests = Profile.find(current_user.id).requestor_relationships
  end
end
