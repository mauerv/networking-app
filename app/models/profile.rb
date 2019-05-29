class Profile < ApplicationRecord
  validates :name, presence: true
  validates :title, presence: true
  validates :country, presence: true

  belongs_to :user
  has_one_attached :image

  has_many :connection_requests, dependent: :destroy

  has_many :requestor_relationships, foreign_key: :contact_id, class_name: 'ConnectionRequest' 
  has_many :requestors, through: :requestor_relationships, source: :profile

  has_many :receiver_relationships, foreign_key: :profile_id, class_name: 'ConnectionRequest'
  has_many :receivers, through: :receiver_relationships, source: :contact

  has_many :connections, dependent: :destroy
  has_many :contacts, through: :connections

  def remove_contact(contact)
  	self.contacts.destroy(contact)
  end	
end



