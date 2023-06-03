class Event < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :bookings
  has_many :users, through: :bookings
end
