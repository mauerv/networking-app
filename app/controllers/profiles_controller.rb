class ProfilesController < ApplicationController
	def index
    @profiles = Profile.paginate(page: params[:page])
	end

	def show
		@profile = Profile.find(params[:id])
	end

  def edit
    @profile = Profile.find(params[:id])
    if current_user.profile != @profile 
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end

  def update
  	@profile = Profile.find(params[:id])
  	if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated"
      redirect_to @profile
  	else
  		render 'edit'
  	end
  end

	def new
	end

	private

		def profile_params
			params.require(:profile).permit(:name, :title, :country, :description, :image)
		end
end
