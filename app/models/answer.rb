class Answer < ApplicationRecord
  validates :content, presence: true, length: { maximum: 3000 }
  validate :best_answer_exsists_only_one
  include ActiveModel::Validations
  validates_with ClosedAnswerValidator, on:[:create]
  validates_with QuestionerCannotAnswerValidator, on:[:create]
  belongs_to :user
  belongs_to :question
  has_many :answer_likes
  has_one :questioner_response
  
  # def cannot_answer_closed_question
  #   question = Question.find(answer.question_id)
  #   if question.is_open == 0
  #     errors.add(:answer, "close済みの質問には回答できません")
  #   end
  # end
  
  def best_answer_exsists_only_one
    answers = Answer.where(question_id: self.question_id)
    if !answers.where(is_best_answer: 1).empty?
      errors.add(:answer, "すでにベストアンサーを選んでいます。")
    end
  end
  
  def put_best_answer_first(question_id)
    answers = Answers.find_by(question_id)
    answers.order("is_best_answer DESC")
  end
end
