class Event < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :bookings
  has_many :users, through: :bookings
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
