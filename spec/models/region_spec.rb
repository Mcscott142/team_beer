require 'rails_helper'

describe Region do

  it 'creates a new full entry' do
    FactoryGirl.create(:region).should be_valid
  end

  it 'requires name' do
    region = FactoryGirl.build(:region, name: nil)
    expect(region.valid?) == false
  end

end
