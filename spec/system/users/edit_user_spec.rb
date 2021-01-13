# frozen_string_literal: true

require 'rails_helper'

feature 'Edit user' do
  let(:new_email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 8) }
  let!(:user) { create(:user, password: password) }

  feature 'being logged out' do
    scenario 'can not access page' do
      visit edit_user_registration_path

      expect(page).to have_text('You need to sign in or sign up before continuing')
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  feature 'being logged in' do
    before do
      sign_in(user)
    end

    scenario 'can change the user data' do
      visit edit_user_registration_path

      fill_in 'Email', with: new_email
      fill_in 'Current password', with: password
      click_on 'Update'

      expect(page).to have_text('Your account has been updated successfully')
      expect(page).to have_current_path(root_path)
    end
  end
end
