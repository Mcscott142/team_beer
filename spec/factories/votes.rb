FactoryGirl.define do
  factory :vote do
    vote "0"
    voteable_id "1"
    voteable_type "beer"
    user_id 1
  end
end
