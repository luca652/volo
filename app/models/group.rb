class Group < ApplicationRecord
  belongs_to :user
  has_one :chatroom
  has_many :requests
  has_many :events
  has_many :users, through: :requests
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
