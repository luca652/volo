class Resource < ApplicationRecord
  has_many :pins, dependent: :destroy
  has_many :users, through: :pins

  validates :title, presence: true

  def pin_count
    pins.count
  end
end
