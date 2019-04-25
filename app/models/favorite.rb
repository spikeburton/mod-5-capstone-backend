class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :drive

  def to_json
    {
      user_id: self.user_id,
      drive_id: self.drive_id
    }
  end

  def self.all_json
    Favorite.all.collect(&:to_json)
  end
end
