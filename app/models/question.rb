class Question < ApplicationRecord
  validates :content, presence: true, length: { maximum: 3000 }
  validates :title, presence: true, length:{maximum: 50}
  validates :is_open, presence: true
  belongs_to :user
  belongs_to :category
  has_many :answers
  
  has_many :question_likes
  
  def retrieve_top_question
    con = ActiveRecord::Base.connection
    con.select_all("SELECT question_id, COUNT(*) AS COUNT from question_likes GROUP BY question_id
                                          ORDER BY COUNT DESC LIMIT 10").to_hash
  end
  
end
