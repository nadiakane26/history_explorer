class Comment < ApplicationRecord
  belongs_to :landmark
  belongs_to :user
  acts_as_votable

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "id_value", "landmark_id", "updated_at", "user_id"]
  end

end
