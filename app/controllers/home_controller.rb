class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
  end

  def feed
    @profile = Profile.find(current_user.id)
  end
end
