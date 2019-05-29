class ProfilesController < ApplicationController
	before_action :set_profile, only: [:show, :edit, :update]

  def index
    @profiles = Profile.paginate(page: params[:page])
    @contacts = Profile.find(current_user.id).contacts
	end

	def show
	end

  def edit
    head(403) if @profile.id != current_user.id 
  end

  def update
    if @profile.id == current_user.id
    	if @profile.update(profile_params)
        flash[:notice] = "Profile updated"
        redirect_to @profile 
    	else
    		render 'edit'
    	end
    else
      head(403)
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
