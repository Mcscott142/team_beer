require 'rails_helper'

feature 'user views the page for a beer and adds a review', %Q{
As a site visitor
I want to view my favorite beer so
that I can add a review so
that everyone knows how good it is.
} do

  scenario 'user visits the page for a specific beer' do
    user = FactoryGirl.create(:user)
    sign_in_test_user(user)

    beer = FactoryGirl.create(:beer)

    visit '/beers'
    click_on beer.name

    expect(page).to have_content beer.name
    expect(page).to have_content beer.alcohol_content
    expect(page).to have_content beer.description
    expect(page).to have_content beer.beer_type.name
    expect(page).to have_content beer.brewery.name

  end

  scenario 'user adds a review for a specific beer' do

    user = FactoryGirl.create(:user)
    sign_in_test_user(user)

    beer = FactoryGirl.create(:beer)
    visit '/beers'
    click_on beer.name

    fill_in "Title", with: "My Review...."
    fill_in "Review", with: "This beer rocks!"
    choose '5'

    click_on 'Create Review'

    expect(page).to have_content beer.name
    expect(page).to have_content beer.alcohol_content
    expect(page).to have_content beer.description
    expect(page).to have_content beer.beer_type.name
    expect(page).to have_content beer.brewery.name

    expect(page).to have_content "My Review...."
    expect(page).to have_content "This beer rocks!"
    expect(page).to have_content "5"

  end
end
