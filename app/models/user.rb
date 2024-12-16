class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :landmarks, dependent: :destroy
  has_many :regions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  belongs_to :role
  validates :first_name, :last_name, presence: true
  validates :username, presence: true, uniqueness: true

  def admin?
    role && role.name == "admin"
  end
  
  def user?
    role && role.name == "user"
  end

  after_create :assign_default_role

  private

  def assign_default_role
    # If the user doesn't already have a role, assign the default 'user' role
    user_role = Role.find_or_create_by(name: "user")
    self.roles << user_role if roles.empty?
  end
end
