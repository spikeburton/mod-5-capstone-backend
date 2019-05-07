class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :drive

  def as_json(*)
    super.tap do |hash|
      hash["added_by"] = self.user.username
    end
  end
end
