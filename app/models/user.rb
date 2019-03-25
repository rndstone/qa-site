class User < ApplicationRecord
  validates :name, presence: true, length:{maximum:50}, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  
  validates :password, length:{in: 8..128}
  has_secure_password
  
  has_many :questions
  has_many :answers
  
  has_many :question_likes
  has_many :answer_likes
  has_many :funds
  
  mount_uploader :image_name, ImageUploader
  
  def apply_login_bornus(amount=30)
    Fund.transaction do
      fund = Fund.find_by(user_id: self.id, currency_type: 1)
      fund.update!(amount: fund.amount + amount)
      transfer = Transfer.new(amount: amount, currency_type: CurrencyType.find(1), tradetype: 1)
      transfer.save!
      transfer.transfer_tos.create(to_user: self.id)
    end
  end
end
