FactoryGirl.define do
  factory :review do
    rating "3"
    title 'mediocre beer'
    description 'this beer is very average'
    user_id 1
    beer_id 1
  end
end
