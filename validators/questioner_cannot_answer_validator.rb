class QuestionerCannotAnswerValidator < ActiveModel::Validator
  def validate(record)
    question = Question.find(record.question_id)
    if question.user_id == record.user_id
      record.errors.add(:answer, "質問者は回答できません")
    end
  end
end