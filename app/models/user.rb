class User < ApplicationRecord
  require 'securerandom'
  has_many :favorites
  has_secure_password

  before_create :create_api_key

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password

  def add_fav(data)
    favorites.find_or_create_by(location: data[:location].downcase)
  end

  private

  def create_api_key
    self.api_key = SecureRandom.uuid
  end

end