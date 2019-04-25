class User < ApplicationRecord
  has_secure_password
  has_many :favorites
  has_many :drives, through: :favorites

  def to_json
    {
      id: self.id,
      username: self.username,
      email: self.email,
      first_name: self.first_name,
      last_name: self.last_name
    }
  end
end
