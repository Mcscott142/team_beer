require 'rails_helper'

describe Region do

  it 'creates a new full entry' do
    Factory.build(:region).should be_valid
  end

  it 'requires name' do
    Factory.build(:region, name: nil).should_not be_valid
  end

end
