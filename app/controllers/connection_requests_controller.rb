class ConnectionRequestsController < ApplicationController
  before_action :set_connection_request, only: [:update, :destroy, :withdraw]

  def index
    @profile = Profile.find(current_user.id)
  end

  def create
  	@connection_request = ConnectionRequest.new(connection_request_params)
    if @connection_request.profile_id == current_user.id
      respond_to do |format|
        if @connection_request.save
          format.json { render json: @connection_request, status: :created, location: @connection_request }
        else
          format.json { render json: @connection_request.errors, status: :unprocessable_entity }
        end
      end
    else
      head(403)
    end
  end

  def update
    if @connection_request.contact_id == current_user.id
      @connection_request.accept
      respond_to do |format|
        format.json { head :no_content }
      end
    else
      head(403)
    end 
  end

  def destroy
    if (@connection_request.contact_id == current_user.id) 
      @connection_request.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    else
      head(403)
    end 
  end

  def withdraw
    if (@connection_request.profile_id == current_user.id)
      @connection_request.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    else
      head(403)
    end
  end

  private 

    def set_connection_request
      @connection_request = ConnectionRequest.find(params[:id])
    end

    def connection_request_params
    	params.require(:connection_request).permit(:request_message, :contact_id, :profile_id)
    end
end
