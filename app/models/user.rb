class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups
  has_many :requests
  has_many :resources
  has_many :pins
  has_many :events
  has_many :bookings
  has_many :messages
  validates :first_name, :last_name, presence: true
end
