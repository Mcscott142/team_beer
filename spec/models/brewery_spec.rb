require 'rails_helper'

describe Brewery do

  it 'creates a new full entry' do
    Factory.build(:brewery).should be_valid
  end

  it 'requires name' do
    Factory.build(:brewery, name: nil).should_not be_valid
  end

  it 'requires description' do
    Factory.build(:brewery, description: nil).should_not be_valid
  end

  it 'requires city' do
    Factory.build(:brewery, city: nil).should_not be_valid
  end

  it 'requires state' do
    Factory.build(:brewery, state: nil).should_not be_valid
  end

end
