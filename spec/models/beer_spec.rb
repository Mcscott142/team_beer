require 'rails_helper'

describe Beer do

  describe 'Associations' do

    it 'associates beer with type' do
      type = FactoryGirl.create(:beer_type)
      beer = FactoryGirl.create(:beer, beer_type: type)
      beer.beer_type.should == type
    end

    it 'associates beer with brewery' do
      brewery = FactoryGirl.create(:brewery)
      beer = FactoryGirl.create(:beer, brewery: brewery)
      beer.brewery.should == brewery
    end
  end

  it 'creates a new full entry' do
    FactoryGirl.create(:beer).should be_valid
  end

  it 'requires name' do
    beer = FactoryGirl.build(:beer, name: nil)
    expect(beer.valid?) == false
  end

  it 'requires description' do
    beer = FactoryGirl.build(:beer, description: nil)
    expect(beer.valid?) == false
  end


  it 'searches for a value' do
      beer = FactoryGirl.create(:beer, name: "miller")
      results = Beer.beer_search('miller')
      expect(results.count).to eq(1)
  end


end
