# frozen_string_literal: true

require 'rails_helper'

feature 'User sign up' do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 8) }

  feature 'with correct data' do
    scenario 'signs up successfully' do
      visit new_user_registration_path

      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_on 'Sign up'

      expect(page).to have_text('Welcome! You have signed up successfully')
      expect(page).to have_current_path(root_path)
    end
  end

  feature 'with incorrect data' do
    scenario 'fails to sign up' do
      visit new_user_registration_path

      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: 'wrong confirmation'
      click_on 'Sign up'

      expect(page).to have_text('1 error prohibited this user from being saved')
      expect(page).to have_text("Password confirmation doesn't match Password")
    end
  end

  feature 'with other users email' do
    let!(:user) { create(:user, email: email) }

    scenario 'fails to sign up' do
      visit new_user_registration_path

      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_on 'Sign up'

      expect(page).to have_text('1 error prohibited this user from being saved')
      expect(page).to have_text('Email has already been taken')
    end
  end
end
