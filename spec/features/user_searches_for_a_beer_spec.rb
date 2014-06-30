require 'rails_helper'

feature 'user searches for a beer', %Q{
  # -As a user I would return a list of beers that match my search criteria
} do

  scenario '-user can search for a beer' do

    FactoryGirl.create(:beer, name: "Fat Tire")

    visit "/"

    fill_in "query", with: 'Fat Tire'
    click_on 'Search'

    expect(page).to have_content 'Fat Tire'

  end

  scenario '-user search results match criteria' do

    FactoryGirl.create(:beer, name: "Fat Tire")
    FactoryGirl.create(:beer, name: "Flat Tier")

    visit "/"
    fill_in 'search', with: 'Fat Tire'
    click_on 'Search'

    expect(page).to have_content 'Fat Tire'
    expect(page).to_not have_content 'Flat Tier'

  end


end
