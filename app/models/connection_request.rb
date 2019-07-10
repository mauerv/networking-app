class ConnectionRequest < ApplicationRecord
	validates :profile_id, presence: true
	validates :contact_id, presence: true
	validate :not_existent, :not_self, :not_contact

	belongs_to :profile
	belongs_to :contact, class_name: 'Profile'

	# Adds a profile as contact and destroys the request.
	def accept
		profile.contacts << contact
		destroy
	end

	# Checks that the request or the reciprocal doesn't already exist.
	def not_existent
		if profile.requestors.include?(contact)
			errors.add(:contact_id, "reciprocal request already exists.")
		elsif profile.receivers.include?(contact)
			errors.add(:profile_id, "request already exists.")
		end
	end

	# Checks that a user isn't trying to create a request to herself.
	def not_self
	  errors.add(:profile_id, "Can't request self.")	if profile == contact
	end

	# Checks that the request isn't going to an already established contact.
	def not_contact
	 	errors.add(:profile_id, "Can't request contact.")	if profile.contacts.include?(contact)
	end
end
