class ContactsController < ApplicationController
  def index
  	@contacts = Profile.find(current_user.id).contacts.paginate(page: params[:page])
  end

  def destroy
  	Profile.find(current_user.id).remove_contact(Profile.find(params[:id]))

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
