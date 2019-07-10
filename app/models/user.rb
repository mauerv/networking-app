class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  after_create :init_profile

  # Automatically creates and links a profile for every new user.
  def init_profile
  	self.create_profile!
  end
end
