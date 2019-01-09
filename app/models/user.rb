class User < ApplicationRecord
  require 'securerandom'
  has_many :favorites
  has_secure_password

  before_create :create_api_key

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password

  def add_fav(data_in)
    favorites.find_or_create_by(location: data_in[:location].downcase)
  end

  def destroy_fav(data_in)
    entry = favorites.find_by(location: data_in[:location].downcase)
    entry.delete
  end

  private

  def create_api_key
    self.api_key = SecureRandom.uuid
  end

end