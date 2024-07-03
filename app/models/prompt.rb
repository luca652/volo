class Prompt < ApplicationRecord
  belongs_to :user
  has_one :story

  validates :protagonist, :food, :enemy, presence: true, length: { maximum: 100 }
  validates :setting, presence: true, length: { maximum: 500 }
  validates :language, presence: true
end
