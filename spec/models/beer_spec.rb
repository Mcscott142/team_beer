require 'rails_helper'

describe Beer do

  it 'creates a new full entry' do
    Factory.build(:beer).should be_valid
  end

  it 'requires name' do
    Factory.build(:beer, name: nil).should_not be_valid
  end

  it 'requires description' do
    Factory.build(:beer, description: nil).should_not be_valid
  end

end
