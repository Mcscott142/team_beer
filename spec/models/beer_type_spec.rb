require 'rails_helper'

describe BeerType do

  it 'creates a new full entry' do
    FactoryGirl.create(:beer_type).should be_valid
  end

  it 'requires name' do
    beertype = FactoryGirl.build(:beer_type, name: nil)
    expect(beertype.valid?) == false
  end

end
