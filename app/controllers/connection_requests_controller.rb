class ConnectionRequestsController < ApplicationController
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
    
    if @connection_request.save
      flash[:notice] = "Request sent."
      redirect_to profiles_path
    else
    	flash[:alert] = "Request not sent."
    	redirect_to profiles_path
    end
  end

  private 

  def connection_request_params
  	params.require(:connection_request).permit(:request_message, :contact_id, :profile_id)
  end
end
