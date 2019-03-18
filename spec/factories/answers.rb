FactoryBot.define do
  factory :answer do
    id 1
    content "test"
    user_id 1
    question_id 1
    is_best_answer 0
  end
end
