class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :set_global_search_var

	def set_global_search_var 
		@q = Profile.search(params[:q])
	end
end
