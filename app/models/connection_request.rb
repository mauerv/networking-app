class ConnectionRequest < ApplicationRecord
	validates :profile_id, presence: true
	validates :contact_id, presence: true

	belongs_to :profile
	belongs_to :contact, class_name: 'Profile' 

	def accept
		profile.contacts << contact
		destroy
	end
end
