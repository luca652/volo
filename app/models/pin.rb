class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :resource

  validates :user_id, uniqueness: { scope: :resource_id }
end
