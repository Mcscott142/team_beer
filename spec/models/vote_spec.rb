require 'rails_helper'

describe Vote do

  describe 'Associations' do
    it 'associates vote with beer' do
      beer = FactoryGirl.create(:beer)
      vote = FactoryGirl.create(:vote, voteable_type: "Beer", voteable_id: beer.id)
      beer.votes.first.should == vote
    end

    it 'associates vote with review' do
      review = FactoryGirl.create(:review)
      vote = FactoryGirl.create(:vote, voteable_type: "Review", voteable_id: review.id)
      review.votes.first.should == vote
    end
  end

  it 'creates a new full entry' do
    FactoryGirl.create(:vote).should be_valid
  end

  it 'requires vote' do
    vote = FactoryGirl.build(:vote, vote: nil)
    expect(vote.valid?) == false
  end

  it 'requires vote between -1 and 1' do
    vote = FactoryGirl.build(:vote, vote: -2)
    expect(vote.valid?) == false
  end

  it 'requires vote between -1 and 1' do
    vote = FactoryGirl.build(:vote, vote: 2)
    expect(vote.valid?) == false
  end

  it 'requires voteable_id' do
    vote = FactoryGirl.build(:vote, voteable_id: nil)
    expect(vote.valid?) == false
  end

  it 'requires user_id' do
    vote = FactoryGirl.build(:vote, user_id: nil)
    expect(vote.valid?) == false
  end

  it 'requires voteable_type' do
    vote = FactoryGirl.build(:vote, voteable_type: nil)
    expect(vote.valid?) == false
  end
end
