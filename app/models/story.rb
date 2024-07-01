class Story < ApplicationRecord
  belongs_to :user
  belongs_to :prompt

  validates :title, presence: true
  validates :content, presence: true
end
