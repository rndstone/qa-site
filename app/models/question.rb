class Question < ApplicationRecord
  validates :content, presence: true, length: { maximum: 3000 }
  validates :title, presence: true, length:{maximum: 50}
  belongs_to :user
end
