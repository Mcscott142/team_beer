# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password '1234abcd'
    username 'beer4life'
    is_21 true
    is_admin false

    trait :admin do
      is_admin true
    end

    factory :admin, traits: [:admin]
  end
end
