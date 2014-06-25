FactoryGirl.define do
  factory :vote do
    vote "0"

    trait :beer_vote do
      voteable_type 'Beer'
      association :voteable, factory: :beer
      association :user, factory: :user
    end

    trait :review_vote do
      voteable_type 'Review'
      association :voteable, factory: :review
      association :user, factory: :user
    end


    factory :beer_vote, traits: [:beer_vote]
    factory :review_vote, traits: [:review_vote]

  end
end
