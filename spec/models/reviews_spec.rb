require 'rails_helper'

describe Review do

  it 'creates a new full entry' do
    Factory.build(:review).should be_valid
  end

  it 'requires title' do
    Factory.build(:review, title: nil).should_not be_valid
  end

  it 'requires description' do
    Factory.build(:review, description: nil).should_not be_valid
  end

  it 'requires rating' do
    Factory.build(:review, rating: nil).should_not be_valid
  end

  it 'requires rating 1-5' do
    Factory.build(:review, rating: 6).should_not be_valid
  end

  it 'requires rating 1-5' do
    Factory.build(:review, rating: 0).should_not be_valid
  end

  it 'requires user_id' do
    Factory.build(:review, user_id: nil).should_not be_valid
  end

  it 'requires beer_id' do
    Factory.build(:review, beer_id: nil).should_not be_valid
  end

end
