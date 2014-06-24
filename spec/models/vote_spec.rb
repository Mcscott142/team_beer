require 'rails_helper'

describe Vote do

  describe 'Associations' do
    it 'associates vote with beer' do
      beer = FactoryGirl.create(:beer)
      vote = FactoryGirl.create(:vote, voteable_type: "beer", voteable_id: 1 )

      beer.votes.first.should == vote
    end

    it 'associates vote with review' do
      review = FactoryGirl.create(:review)
      vote = FactoryGirl.create(:vote, voteable_type: "review", voteable_id: 1 )

      review.votes.first.should == vote
    end
  end

  it 'creates a new full entry' do
    FactoryGirl.create(:vote).should be_valid
  end

  it 'requires vote' do
    FactoryGirl.create(:vote, vote: nil).should_not be_valid
  end

  it 'requires vote between -1 and 1' do
    FactoryGirl.create(:vote, vote: -2).should_not be_valid
  end

  it 'requires vote between -1 and 1' do
    FactoryGirl.create(:vote, vote: 2).should_not be_valid
  end

  it 'requires voteable_id' do
    FactoryGirl.create(:vote, voteable_id: nil).should_not be_valid
  end

  it 'requires user_id' do
    FactoryGirl.create(:vote, user_id: nil).should_not be_valid
  end

  it 'requires voteable_type' do
    FactoryGirl.create(:vote, voteable_type: nil).should_not be_valid
  end

end
