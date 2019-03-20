FactoryBot.define do
  factory :user do
    id 1
    name "test"
    email "test@testmail.com"
    password "testpassword"
  end
  
  factory :user2, class: User do
    id 2
    name "test2"
    email "test2@testmail.com"
    password "test2password"
  end
end
