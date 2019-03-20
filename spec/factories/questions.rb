FactoryBot.define do
  factory :question do
    id 1
    content "test"
    title "test-title"
    # user_id 1
    # category_id 1
    association :user
    association :category
    is_open 1
  end
end
