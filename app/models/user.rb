require 'bcrypt'

class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :username
  validates :password, length: { minimum: 6 }

  def self.authenticate(username, password)
    user = find_by(username: username)

    user && user.password == password
  end
end
