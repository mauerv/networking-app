class ConnectionRequestsController < ApplicationController
  before_action :set_connection_request, only: [:update, :destroy]

  def new
  	@connection_request = ConnectionRequest.new()
  	@contact_id = params[:contact_id]
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

  def create
  	@connection_request = ConnectionRequest.new(connection_request_params)
    if @connection_request.profile_id == current_user.id
      if @connection_request.save
        flash[:notice] = "Request sent."
        redirect_to profiles_path
      else
        p @connection_request.errors
        flash[:alert] = "Request not sent."
        redirect_to profiles_path
      end
    else
      head(403)
    end
  end

  def update
    if @connection_request.contact_id == current_user.id
      @connection_request.accept
      redirect_to root_path, notice: 'Invitation was accepted.'  
    else
      head(403)
    end 
  end

  def destroy
    if (@connection_request.contact_id == current_user.id ||
        @connection_request.profile_id == current_user.id)    
      @connection_request.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Invitation was rejected.' }
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
