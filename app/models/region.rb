class Region < ApplicationRecord
  belongs_to :user

  has_many :landmarks
end
