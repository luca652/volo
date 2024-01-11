class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups
  has_many :requests
  has_many :resources
  has_many :pins
  has_many :pinned_resources, through: :pins, source: :resource
  has_many :events
  has_many :bookings
  # has_many :events, through: :bookings
  has_many :messages
  # has_many :prompts
  has_many :stories
  validates :first_name, :last_name, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?


  def has_pinned?(resource)
    pins.exists?(resource: resource)
  end

  def group_admin?(group)
    self.id == group.user_id
  end

end
