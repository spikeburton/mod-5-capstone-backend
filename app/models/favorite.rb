class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :drive

  validates_uniqueness_of :drive_id, scope: :user_id

  def as_json(*)
    super.except("created_at", "updated_at")
  end
end
