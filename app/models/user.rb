require 'securerandom'

class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password

  before_create :create_api

  def create_api
    self.api_key = SecureRandom.base64(30)
  end
end
