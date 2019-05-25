class ContactsController < ApplicationController
  def index
  	@contacts = Profile.find(current_user.id).contacts
  end
end
