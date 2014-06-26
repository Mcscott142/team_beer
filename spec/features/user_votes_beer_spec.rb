require 'rails_helper'

feature 'user votes on a beer', %Q{
As a logged in user
I want to be able to upvote
and downvote a beer
} do

  scenario 'user upvotes a beer' do
    user = FactoryGirl.create(:user)
    sign_in_test_user(user)

    beer = FactoryGirl.create(:beer)

    visit '/beers'

    click_on "Upvote"

    beer.votes.first.vote.should == 1
  end

  scenario 'user downvotes a beer' do
    user = FactoryGirl.create(:user)
    sign_in_test_user(user)

    beer = FactoryGirl.create(:beer)

    visit '/beers'

    click_on "Downvote"

    beer.votes.first.vote.should == -1
  end

  scenario 'user votes on a beer a second time' do
    user = FactoryGirl.create(:user)
    sign_in_test_user(user)

    beer = FactoryGirl.create(:beer)

    visit '/beers'
    click_on "Upvote"
    click_on "Upvote"

    expect(page).to have_content "already"
  end
end
