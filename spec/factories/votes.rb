FactoryGirl.define do
  factory :vote do
    vote "0"
    votable_id "1"
    votable_type "beer"

    user
  end
end
