class Fund < ApplicationRecord
  validates :currency_type, presence: true, uniqueness: true
  belongs_to :user
end
