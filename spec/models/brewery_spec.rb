require 'rails_helper'

describe Brewery do

  describe 'Associations' do
    it 'associates brewery with region' do
      region = FactoryGirl.create(:region)
      brewery = FactoryGirl.create(:brewery, region_id: 1)

      brewery.region.should == region
    end
  end

  it 'creates a new full entry' do
    FactoryGirl.create(:brewery).should be_valid
  end

  it 'requires name' do
    FactoryGirl.create(:brewery, name: nil).should_not be_valid
  end

  it 'requires description' do
    FactoryGirl.create(:brewery, description: nil).should_not be_valid
  end

  it 'requires city' do
    FactoryGirl.create(:brewery, city: nil).should_not be_valid
  end

  it 'requires state' do
    FactoryGirl.create(:brewery, state: nil).should_not be_valid
  end

end
