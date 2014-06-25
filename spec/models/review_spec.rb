require 'rails_helper'

describe Review do

  it 'creates a new full entry' do
    FactoryGirl.build(:review).should be_valid
  end

  it 'requires title' do
    review = FactoryGirl.build(:review, title: nil)
    expect(review.valid?) == false
  end

  it 'requires description' do
    review = FactoryGirl.build(:review, description: nil)
    expect(review.valid?) == false
  end

  it 'requires rating' do
    review = FactoryGirl.build(:review, rating: nil)
    expect(review.valid?) == false
  end

  it 'requires rating 1-5' do
    review = FactoryGirl.build(:review, rating: 6)
    expect(review.valid?) == false
  end

  it 'requires rating 1-5' do
    review = FactoryGirl.build(:review, rating: 0)
    expect(review.valid?) == false
  end

  it 'requires user_id' do
    review = FactoryGirl.build(:review, user_id: nil)
    expect(review.valid?) == false
  end

  it 'requires beer_id' do
    review = FactoryGirl.build(:review, beer_id: nil)
    expect(review.valid?) == false
  end

end
