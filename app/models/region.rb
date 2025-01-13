class Region < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user

  has_many :landmarks


  def self.ransackable_attributes(auth_object = nil)
    %w[id name description created_at updated_at] # Add attributes you want to be searchable
  end
  def self.ransackable_associations(auth_object = nil)
    %w[landmarks user] # Add associations you want to be searchable
  end
end
