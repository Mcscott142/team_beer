# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password '1234abcd'
    username 'beer4life'
  end
end
