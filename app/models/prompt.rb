class Prompt < ApplicationRecord
  belongs_to :user
  has_one :story

  validates :protagonist, :food, :enemy, presence: true, length: { minimum: 2, maximum: 100 }
  validates :setting, presence: true, length: { minimum: 2, maximum: 500 }
  validates :language, presence: true
end
