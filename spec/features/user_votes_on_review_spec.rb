require 'rails_helper'

feature 'user votes on a review', %Q{
As a logged in user
I want to be able to upvote
a review of a certain beer
} do

  scenario 'user upvotes a review' do
    user = FactoryGirl.create(:user)
    sign_in_test_user(user)

    review = FactoryGirl.create(:review)

    visit "/beers/#{review.beer.id}"
    click_on "this was helpful!"

    review.votes.first.vote.should == 1
  end

  scenario 'user votes on a review a second time' do
    user = FactoryGirl.create(:user)
    sign_in_test_user(user)

    review = FactoryGirl.create(:review)

    visit "/beers/#{review.beer.id}"
    click_on "this was helpful!"
    click_on "this was helpful!"

    expect(page).to have_content "You already voted on that!"
    review.votes.count.should == 1
  end
end
