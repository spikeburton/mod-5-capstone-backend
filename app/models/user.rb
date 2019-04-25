class User < ApplicationRecord
  has_secure_password

  has_many :favorites, dependent: :destroy
  has_many :drives, through: :favorites

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, format: { with: /.+\@.+\..+/ }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def to_json
    {
      id: self.id,
      username: self.username,
      email: self.email,
      first_name: self.first_name,
      last_name: self.last_name,
      favorites: self.favorites.all_json
    }
  end

  def self.all_json
    User.all.collect(&:to_json)
  end
end
