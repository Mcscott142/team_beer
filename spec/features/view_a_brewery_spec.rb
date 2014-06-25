require 'rails_helper'

feature 'user views the page for a brewery', %Q{
  As a site visitor
  I want to view a brewery so
  I can see it's details and
  a list of beers they brew.
} do

  scenario 'user visits brewery page' do
    FactoryGirl.create(:brewery)
    user = FactoryGirl.create(:user)
    beer = FactoryGirl.create(:beer, brewery_id: 1)

    visit '/'
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Go!'

    visit brewery_path
    expect(page).to have_content 'Generic Brewery'
    expect(page).to have_content 'MA'
    expect(page).to have_content 'Boston'
    expect(page).to have_content 'MA'
    expect(page).to have_content 'an old brewery'
    expect(page).to have_content 'www.google.com'
    expect(page).to have_content 'Northeast'
    expect(page).to have_content 'Generic Beer'
  end

end
