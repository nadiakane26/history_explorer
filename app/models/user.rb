class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :landmarks, dependent: :destroy
  has_many :regions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  has_and_belongs_to_many :roles
  validates :first_name, :last_name, presence: true
  validates :username, presence: true, uniqueness: true

  def admin?
    roles.exists?(name: "admin")
  end

  def user?
    roles.exists?(name: "user")
  end

  after_create :assign_default_role

  private

  def assign_default_role
    # If the user doesn't already have a role, assign the default 'user' role
    self.roles << Role.find_by(name: "user") if roles.empty?
  end
end
