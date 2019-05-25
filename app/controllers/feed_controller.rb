class FeedController < ApplicationController
  def index
  	@connection_requests = Profile.find(current_user.id).requestor_relationships
  end
end
