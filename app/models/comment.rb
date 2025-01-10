class Comment < ApplicationRecord
  belongs_to :landmark
  belongs_to :user
  acts_as_votable
end
