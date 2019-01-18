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
  
  mount_uploader :image_name, ImageUploader
end
