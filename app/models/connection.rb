class Connection < ApplicationRecord
	after_create do |c|
		if !Connection.find_by(contact_id: c.profile_id)	
			c.contact.connections.create(contact: c.profile)
		end
	end
	after_destroy do |c|
		reciprocal = Connection.find(:first, :conditions => { :contact_id => c.profile_id })
		reciprocal.destroy unless reciprocal.nil?
	end

	belongs_to :profile
	belongs_to :contact, class_name: 'Profile'
end
