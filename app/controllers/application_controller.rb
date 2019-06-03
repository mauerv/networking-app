class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :set_global_search_var
	before_action :configure_permitted_parameters, if: :devise_controller?

	def set_global_search_var 
		@q = Profile.search(params[:q])
	end

	def configure_permitted_parameters
		update_attrs = [:password, :password_confirmation, :current_password]
		devise_parameter_sanitizer.permit :account_update, keys: update_attrs
	end
end
