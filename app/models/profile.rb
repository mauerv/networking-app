class Profile < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_one_attached :image

  has_many :connection_requests, dependent: :destroy

  has_many :requestor_relationships, foreign_key: :contact_id, class_name: 'ConnectionRequest'
  has_many :requestors, through: :requestor_relationships, source: :profile

  has_many :receiver_relationships, foreign_key: :profile_id, class_name: 'ConnectionRequest'
  has_many :receivers, through: :receiver_relationships, source: :contact

  has_many :connections, dependent: :destroy
  has_many :contacts, through: :connections

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end

  def remove_contact(contact)
  	self.contacts.destroy(contact)
  end

  def serializable_hash(options={})
    if self.image.attached?
      super(options).merge({"image_url": rails_blob_url(self.image)})
    else
      super(options)
    end
  end
end
