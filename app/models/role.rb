class Role < ApplicationRecord
    has_many :users

    validates :roles, presence: true
end
