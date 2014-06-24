require 'rails_helper'

describe Votes do

  it 'creates a new full entry' do
    Factory.build(:vote).should be_valid
  end

  it 'requires vote' do
    Factory.build(:vote, vote: nil).should_not be_valid
  end

  it 'requires vote between -1 and 1' do
    Factory.build(:vote, vote: -2).should_not be_valid
  end

  it 'requires vote between -1 and 1' do
    Factory.build(:vote, vote: 2).should_not be_valid
  end

  it 'requires voteable_id' do
    Factory.build(:vote, voteable_id: nil).should_not be_valid
  end

  it 'requires user_id' do
    Factory.build(:vote, user_id: nil).should_not be_valid
  end

  it 'requires voteable_type' do
    Factory.build(:vote, voteable_type: nil).should_not be_valid
  end

end
