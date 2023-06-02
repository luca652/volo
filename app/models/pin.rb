class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :resource
  has_many :users, through: :resources
end
