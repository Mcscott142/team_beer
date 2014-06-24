require 'rails_helper'

describe Region do

  it 'creates a new full entry' do
    FactoryGirl.create(:region).should be_valid
  end

  it 'requires name' do
    FactoryGirl.create(:region, name: nil).should_not be_valid
  end

end
