require 'rails_helper'

feature 'user creates an account, signs in, signs out', %Q{
  # -As a user I would like to create an account
  # -As a user I would like to sign in
  # -As a user I would like to sign out
} do

  scenario '-user can create an account' do
    visit "/"
    click_on "Sign Up!"
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '1234abcd'
    fill_in 'Username', with: 'Will1492'
    click_on 'Over 21?'
    click_on 'Submit'

    expect(page).to have_content 'Will1492'
    expect(page).to have_content 'Sign out'
    expect(page).to have_content 'Beer'
  end

  scenario '-user can sign in to their account' do
    visit "/"
    click_on "Signup!"
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '1234abcd'
    fill_in 'Username', with: 'Will1492'
    click_on 'Over 21?'
    click_on 'Submit'

    click_on 'Sign out'
    expect(page).to have_content 'Sign in'
    click_on 'Sign in'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '1234abcd'
    click_on 'Submit'
    expect(page).to have_content 'Will1492'
    expect(page).to have_content 'Sign out'
  end

  scenario '-user can sign out of their account' do
    visit "/"
    click_on "Signup!"
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '1234abcd'
    fill_in 'Username', with: 'Will1492'
    click_on 'Over 21?'
    click_on 'Submit'

    click_on 'Sign out'
    expect(page).to have_content 'Sign in'
    expect(page).to_not have_content 'Will1492'
    expect(page).to_not have_content 'Sign out'
  end
end

