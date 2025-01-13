class Save < ApplicationRecord
  belongs_to :user
  belongs_to :landmark

  validates :user_id, uniqueness: { scope: :landmark_id, message: "You have already saved this landmark." }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "landmark_id", "updated_at", "user_id"]
  end
end
