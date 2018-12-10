class Question < ApplicationRecord
  validates :content, presence: true, length: { maximum: 3000 }
  validates :title, presence: true, length:{maximum: 50}
  validates :is_open, presence: true
  belongs_to :user
  belongs_to :category
end
