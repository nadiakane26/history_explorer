class Comment < ApplicationRecord
  belongs_to :landmark
  belongs_to :user

  has_many :likes, as: :likeable
end
