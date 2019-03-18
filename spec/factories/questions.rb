FactoryBot.define do
  factory :question do
    id 1
    content "test"
    title "test-title"
    user_id 1
    category_id 1
    is_open 1
  end
end
