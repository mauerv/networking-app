class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  has_many :connection_requests

  has_many :requestor_relationships, foreign_key: :receiver_id, class_name: 'ConnectionRequest' 
  has_many :requestors, through: :requestor_relationships

  has_many :receiver_relationships, foreign_key: :requestor_id, class_name: 'ConnectionRequest'
  has_many :receivers, through: :receiver_relationships
end
