require 'rails_helper'

describe Brewery do

  describe 'Associations' do
    it 'associates brewery with region' do
      region = FactoryGirl.create(:region)
      brewery = FactoryGirl.create(:brewery, region: region)
      brewery.region.should == region
    end
  end

  it 'creates a new full entry' do
    FactoryGirl.create(:brewery).should be_valid
  end

  it 'requires name' do
    brewery = FactoryGirl.build(:brewery, name: nil)
    expect(brewery.valid?) == false
  end

  it 'requires description' do
    brewery = FactoryGirl.build(:brewery, description: nil)
    expect(brewery.valid?) == false
  end

  it 'requires city' do
    brewery = FactoryGirl.build(:brewery, city: nil)
    expect(brewery.valid?) == false
  end

  it 'requires state' do
    brewery = FactoryGirl.build(:brewery, state: nil)
    expect(brewery.valid?) == false
  end

end
