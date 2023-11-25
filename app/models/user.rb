class User < ApplicationRecord
  validates_presence_of :email, :password, :auth_token
  validates_uniqueness_of :email, :auth_token

  def setup_token
    self.auth_token = SecureRandom.uuid
  end

  def full_name
    [last_name, first_name].join(" ")
  end
end
