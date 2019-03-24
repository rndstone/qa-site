class Transfer < ApplicationRecord
  has_many :transfer_tos
  # belongs_to :user
  belongs_to :currency_type
end
