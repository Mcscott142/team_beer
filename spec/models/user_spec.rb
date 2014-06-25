require 'rails_helper'

describe User do

  it 'creates a valid record' do
    FactoryGirl.build(:user).should be_valid
  end

  it 'requires email' do
    user = FactoryGirl.build(:user, email: nil)
    expect(user.valid?) == false
  end

  it 'requires encrypted_password' do
    user = FactoryGirl.build(:user, encrypted_password: nil)
    expect(user.valid?) == false
  end

  it 'requires username' do
    user = FactoryGirl.build(:user, username: nil)
    expect(user.valid?) == false
  end

  it 'requires is_21' do
    user = FactoryGirl.build(:user, is_21: nil)
    expect(user.valid?) == false
  end
end
