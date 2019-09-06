class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {maximum: 100}, presence: true
end
