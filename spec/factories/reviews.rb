FactoryGirl.define do
  factory :review do
    rating "3"
    title 'mediocre beer'
    description 'this beer is very average'

    user
    beer
  end
end
