require 'rails_helper'

feature 'user creates an account, signs in, signs out', %Q{
  # -As a user I would like to create an account
  # -As a user I would like to sign in
  # -As a user I would like to sign out
} do

  scenario '-user can create an account' do
    ActionMailer::Base.deliveries = []

    visit "/"
    click_on "Sign Up!"
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '1234abcd'
    fill_in 'Password Confirmation', with: '1234abcd'
    fill_in 'Username', with: 'Will1492'
    check 'Are you over 21?'
    click_on 'Sign Up'

    expect(page).to have_content 'Will1492'
    expect(page).to have_content 'Sign Out'
    expect(page).to have_content 'Beer'

    expect(ActionMailer::Base.deliveries.size).to eql(1)

    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject('Hooray Beer!')
    expect(last_email).to have_content("Welcome Will1492! Crack open a beer - we need your review!")
    expect(last_email).to deliver_to('test@test.com')
  end

  scenario '-user can sign in to their account' do
    visit "/"
    click_on "Sign Up!"
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '1234abcd'
    fill_in 'Password Confirmation', with: '1234abcd'
    fill_in 'Username', with: 'Will1492'
    check 'Are you over 21?'
    click_on 'Sign Up'

    click_on 'Sign Out'
    expect(page).to have_content 'Sign In'
    click_on 'Sign In'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '1234abcd'
    click_on 'Go!'
    expect(page).to have_content 'Will1492'
    expect(page).to have_content 'Sign Out'
  end

  scenario '-user can sign out of their account' do
    visit "/"
    click_on "Sign Up!"
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '1234abcd'
    fill_in 'Password Confirmation', with: '1234abcd'
    fill_in 'Username', with: 'Will1492'
    check 'Are you over 21?'
    click_on 'Sign Up'

    click_on 'Sign Out'
    expect(page).to have_content 'Sign In'
    expect(page).to_not have_content 'Will1492'
    expect(page).to_not have_content 'Sign out'
  end
end

