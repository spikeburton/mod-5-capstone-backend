class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :drive

  validates_uniqueness_of :drive_id, scope: :user_id

  def to_custom_json
    {
      id: self.id,
      user_id: self.user_id,
      drive_id: self.drive_id
    }
  end

  def self.all_json
    Favorite.all.collect(&:to_custom_json)
  end
end
