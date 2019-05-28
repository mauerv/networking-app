class ProfilesController < ApplicationController
	before_action :set_profile, only: [:show, :edit, :update]

  def index
    @profiles = Profile.paginate(page: params[:page])
    @contacts = Profile.find(current_user.id).contacts
	end

	def show
	end

  def edit
    if current_user.profile != @profile 
      render(:file => File.join(Rails.root, 'public/403.html'), 
             :status => 403, :layout => false)
    end
  end

  def update
  	if @profile.update(profile_params)
      flash[:success] = "Profile updated"
      redirect_to @profile
  	else
  		render 'edit'
  	end
  end

	private

    def set_profile
      @profile = Profile.find(params[:id])
    end

		def profile_params
			params.require(:profile).permit(:name, :title, :country, :description, :image)
		end
end
