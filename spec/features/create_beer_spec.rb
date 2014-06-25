require 'rails_helper'

feature 'user adds a new beer', %Q{
As a site visitor
I want to add my favorite beer so
it can be reviewed
} do

# Acceptance Criteria

# I must provide name, description
# I must select a brewery and a beer type
# I can optionally add Alcohol Content and an Image

scenario 'user adds a new beer and submits' do
  FactoryGirl.create(:brewery , name: 'Harpoon')
  user = FactoryGirl.create(:user)
  FactoryGirl.create(:beer_type, name: 'IPA')

  visit '/'
  click_on 'Sign In'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_on 'Go!'

  click_on 'Add a Beer'

  fill_in 'Name', with: 'Winter Warmer'
  fill_in 'Description', with: 'IPA, pretty good'
  select 'Harpoon', from: 'Brewery'
  select 'IPA', from: 'Beer Type'

  click_on 'Submit'

  expect(page).to have_content 'Winter Warmer'
  expect(page).to have_content 'Harpoon'
  expect(page).to have_content 'IPA, pretty good'
  end

end



