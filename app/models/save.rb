class Save < ApplicationRecord
  belongs_to :user
  belongs_to :landmark

  validates :user_id, uniqueness: { scope: :landmark_id, message: "You have already saved this landmark." }
end
