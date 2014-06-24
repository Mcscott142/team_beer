require 'rails_helper'

describe BeerType do

  it 'creates a new full entry' do
    Factory.build(:beer_type).should be_valid
  end

  it 'requires name' do
    Factory.build(:beer_type, name: nil).should_not be_valid
  end

end
