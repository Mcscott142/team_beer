require 'rails_helper'

feature 'admin role exists to police site', %Q{
  # -As an admin I would like to delete added beers
  # -As a admin I would like to delete bad reviews
} do

  scenario '-admin can delete a beer' do

    admin = FactoryGirl.create(:admin)
    beer = FactoryGirl.create(:beer, name: "Fat Tire")

    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_on 'Go!'

    visit "beers/#{beer.id}"

    click_on "DeleteBeer"

    visit "/beers"

    expect(page).to_not have_content beer.name

  end

  scenario '-admin can delete a review' do

    admin = FactoryGirl.create(:admin)
    review = FactoryGirl.create(:review)

    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_on 'Go!'

    visit "beers/#{review.beer.id}"

    click_on "DeleteReview"

    expect(page).to_not have_content review.description

  end

end
