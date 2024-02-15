class Prompt
  include ActiveModel::Model

  attr_accessor :protagonist, :language, :setting, :food, :enemy, :user_id

  validates :protagonist, presence: true
  validates :setting, presence: true
  validates :food, presence: true
  validates :enemy, presence: true
  validates :language, presence: true
end
