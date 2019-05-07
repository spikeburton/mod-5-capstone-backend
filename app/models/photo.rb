class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :drive
end
