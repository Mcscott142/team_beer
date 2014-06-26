def sign_in_test_user(user)
  visit '/'
  click_on 'Sign In'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_on 'Go!'
end
