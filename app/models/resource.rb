class Resource < ApplicationRecord
  has_many :pins, dependent: :destroy
  has_many :users, through: :pins
end
