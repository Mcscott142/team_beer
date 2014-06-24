require 'rails_helper'

describe Beer do

  describe 'Associations' do

    it 'associates beer with type' do
      type = FactoryGirl.create(:beer_type)
      beer = FactoryGirl.create(:beer, type: 1)

      beer.type.should == type
    end

    it 'associates beer with brewery' do
      brewery = FactoryGirl.create(:brewery)
      beer = FactoryGirl.create(:beer, brewery_id: 1)

      beer.brewery.should == brewery
    end
  end

  it 'creates a new full entry' do
    FactoryGirl.create(:beer).should be_valid
  end

  it 'requires name' do
    FactoryGirl.create(:beer, name: nil).should_not be_valid
  end

  it 'requires description' do
    FactoryGirl.create(:beer, description: nil).should_not be_valid
  end

end
