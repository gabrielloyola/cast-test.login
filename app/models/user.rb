class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :username
  validates :password, length: { minimum: 6 }
end
