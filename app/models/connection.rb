class Connection < ApplicationRecord
	# Creates the reciprocal for a connection.
	after_create do |c|
		if !Connection.find_by(contact_id: c.profile_id)
			c.contact.connections.create(contact: c.profile)
		end
	end
	# Destroys the reciprocal of a connection.
	after_destroy do |c|
		reciprocal = Connection.find_by(contact_id: c.profile_id)
		reciprocal.destroy unless reciprocal.nil?
	end

	belongs_to :profile
	belongs_to :contact, class_name: 'Profile'
end
