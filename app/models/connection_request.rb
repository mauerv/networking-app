class ConnectionRequest < ApplicationRecord
	belongs_to :requestor, class_name: 'Profile'
	belongs_to :receiver, class_name: 'Profile' 
	validates :requestor_id, presence: true
	validates :receiver_id, presence: true
end
