class ClosedAnswerValidator < ActiveModel::Validator
  def validate(record)
    question = Question.find(record.question_id)
    if question.is_open == 0
      record.errors.add(:answer, "close済みの質問には回答できません")
    end
  end
end