class Event < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :bookings
  has_many :users, through: :bookings
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validate :date, :event_must_be_in_the_future

  def event_must_be_in_the_future
    errors.add(:date, "can't be in the past") if
      date < Date.today
  end
end
