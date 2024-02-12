class Group < ApplicationRecord
  belongs_to :user
  has_one :chatroom, dependent: :destroy
  has_many :requests
  has_many :events
  has_many :users, through: :requests
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, presence: true
  validates :location, presence: true

  def members
    self.users.joins(:requests).where(requests: { accepted: true }).uniq
  end
end
