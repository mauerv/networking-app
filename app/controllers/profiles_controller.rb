class ProfilesController < ApplicationController
	before_action :set_profile, only: [:show, :edit, :update]

  def index
    @profiles = @q.result(distinct: true).paginate(page: params[:page])
	end

	def show
    user_init_req = @profile.requestor_relationships.select { 
                      |req| (req.profile_id == current_user.id) 
                    }.first
    user_received_req = @profile.receiver_relationships.select {
                          |req| (req.contact_id == current_user.id)
                        }.first
    @connection_request = user_init_req || user_received_req 
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

  def search
    index
    render :index
  end

	private

    def set_profile
      @profile = Profile.find(params[:id])
    end

		def profile_params
			params.require(:profile).permit(:name, :title, :country, :description, :image)
		end
end
