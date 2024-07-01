class Prompt < ApplicationRecord
  belongs_to :user

  validates :protagonist, :setting, :food, :enemy, :language, presence: true

end
