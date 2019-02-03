module AnswersHelper
  def best_answer_has_already_chosen?(q_id)
    Answer.where(question_id: q_id).where(is_best_answer: 1).exists?
  end
end
