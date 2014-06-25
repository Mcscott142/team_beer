FactoryGirl.define do
  factory :beer do
    name "Generic Beer"
    description 'light pilsner'
    alcohol_content '4.8'
    brewery_id 1
    beer_type_id 1
  end
end
