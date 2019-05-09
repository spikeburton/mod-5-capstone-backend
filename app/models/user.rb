class User < ApplicationRecord
  has_secure_password

  has_many :favorites, dependent: :destroy
  has_many :drives, through: :favorites
  has_many :photos, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, format: { with: /.+\@.+\..+/ }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def as_json(*)
    super.except("password_digest", "created_at", "updated_at").tap do |hash|
      hash["favorites"] = self.favorites
    end
  end
end
