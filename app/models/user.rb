class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
		:jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :images

  validates :email,
    presence: true

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  validates :username,
    presence: true
end
