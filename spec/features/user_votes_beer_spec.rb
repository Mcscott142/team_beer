require 'rails_helper'

feature 'user votes on a beer', %Q{
As a logged in user
I want to be able to upvote
and downvote a beer
} do

  scenario 'user upvotes beer' do
    user = FactoryGirl.create(:user)
    sign_in_test_user(user)

    beer = FactoryGirl.create(:beer)

    visit '/beers'

    click_on "Upvote"

    beer.votes.first.vote.should == 1
  end

  scenario 'user downvotes beer' do
    user = FactoryGirl.create(:user)
    sign_in_test_user(user)

    beer = FactoryGirl.create(:beer)

    visit '/beers'

    click_on "Downvote"

    beer.votes.first.vote.should == -1
  end
end
