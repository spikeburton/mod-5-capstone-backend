class Drive < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_many :photos, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :state, presence: true
  validates :bound_a_lng, presence: true
  validates :bound_a_lat, presence: true
  validates :bound_b_lng, presence: true
  validates :bound_b_lat, presence: true

  def as_json(*)
    super.tap do |hash|
      hash["photos"] = self.photos
    end
  end
end
