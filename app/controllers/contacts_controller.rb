class ContactsController < ApplicationController
  def index
  	@contacts = Profile.find(current_user.id).contacts
  end

  def destroy
  	Profile.find(current_user.id).remove_contact(Profile.find(params[:id]))
  	redirect_to contacts_path, notice: 'Contact was deleted.'
  end
end
