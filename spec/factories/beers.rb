FactoryGirl.define do
  factory :beer do
    name "Generic Beer"
    description 'light pilsner'
    alcohol content '4.8'

    brewery
    beer_type
  end
end