class Drive < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :name, presence: true
  validates :description, presence: true
  validates :state, presence: true
  validates :bound_a_lng, presence: true
  validates :bound_a_lat, presence: true
  validates :bound_b_lng, presence: true
  validates :bound_b_lat, presence: true
end
