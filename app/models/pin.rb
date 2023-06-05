class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :resource
  # has_many :users, through: :resources
  validates :user_id, uniqueness: { scope: :resource_id }
end
