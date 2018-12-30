class QuestionLike < ApplicationRecord
  belongs_to :user
  belongs_to :question
  
  def retrieve_top_question
    con = ActiveRecord::Base.connection
    ordered_question = con.select_all("SELECT question_id, COUNT(*) AS COUNT from question_likes GROUP BY question_id
                                          ORDER BY COUNT DESC LIMIT 10").to_hash
    
  end
end
