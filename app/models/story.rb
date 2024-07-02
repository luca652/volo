class Story < ApplicationRecord
  belongs_to :user
  belongs_to :prompt

  validates :title, presence: true
  validates :body, presence: true
end
