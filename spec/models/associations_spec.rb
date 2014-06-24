require 'rails_helper'

describe Associations do

  it 'associates beer with type' do
    type = Factory.build(:type)
    beer = Factory.build(:beer, type: 1)

    beer.type.should == type
  end

  it 'associates beer with brewery' do
    brewery = Factory.build(:brewery)
    beer = Factory.build(:beer, brewery_id: 1)

    beer.brewery.should == brewery
  end

  it 'associates brewery with region' do
    region = Factory.build(:region)
    brewery = Factory.build(:brewery, region_id: 1)

    brewery.region.should == region
  end

  it 'associates vote with beer' do
    beer = Factory.build(:beer)
    vote = Factory.build(:vote, voteable_type: "beer", voteable_id: 1 )

    beer.votes.first.should == vote
  end

  it 'associates vote with review' do
    review = Factory.build(:review)
    vote = Factory.build(:vote, voteable_type: "review", voteable_id: 1 )

    review.votes.first.should == vote
  end

end
