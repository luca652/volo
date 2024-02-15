class Resource < ApplicationRecord
  belongs_to :user
  has_many :pins, dependent: :destroy

  validates :title, presence: true
  validates :comment, presence: true

  def pin_count
    pins.count
  end
end
