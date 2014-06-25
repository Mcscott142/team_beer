require 'rails_helper'

feature 'user views a list of breweries', %Q{
  As a site visitor I want to view a list of breweries so I can see thier details
  and beer selection
  } do

  # Acceptance Criteria:
  # I can see a list of breweries with name and state


  scenario 'view list of breweries' do

  FactoryGirl.create(:brewery , name: 'Harpoon')
  user = FactoryGirl.create(:user)
  beer = FactoryGirl.create(:beer, brewery_id: 1)

  visit '/'
  click_on 'Sign In'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_on 'Go!'

  visit breweries_path
  expect(page).to have_content 'Harpoon'
  expect(page).to have_content 'MA'
  expect(page).to have_content 'Northeast'
  end
end
