require 'rails_helper'

describe Review do

  it 'creates a new full entry' do
    FactoryGirl.create(:review).should be_valid
  end

  it 'requires title' do
    FactoryGirl.create(:review, title: nil).should_not be_valid
  end

  it 'requires description' do
    FactoryGirl.create(:review, description: nil).should_not be_valid
  end

  it 'requires rating' do
    FactoryGirl.create(:review, rating: nil).should_not be_valid
  end

  it 'requires rating 1-5' do
    FactoryGirl.create(:review, rating: 6).should_not be_valid
  end

  it 'requires rating 1-5' do
    FactoryGirl.create(:review, rating: 0).should_not be_valid
  end

  it 'requires user_id' do
    FactoryGirl.create(:review, user_id: nil).should_not be_valid
  end

  it 'requires beer_id' do
    FactoryGirl.create(:review, beer_id: nil).should_not be_valid
  end

end
