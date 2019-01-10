module AnswersHelper
  def best_answer_has_already_chosen?(q_id)
    # answers = Answer.find_by(question_id)
    Answer.where(question_id: q_id).where(is_best_answer: 1)
  end
end
