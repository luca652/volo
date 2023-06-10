class Resource < ApplicationRecord
  has_many :pins, dependent: :destroy
  has_many :users, through: :pins

  has_many :pins

  def pin_count
    pins.count
  end
end
