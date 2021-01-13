# frozen_string_literal: true

require 'rails_helper'

feature 'User reset password' do
  let!(:user) { create(:user) }

  feature 'with an existing email' do
    scenario 'sends a reset password email' do
      visit new_user_password_path

      fill_in 'Email', with: user.email
      click_on 'Send me reset password instructions'

      expect(page).to have_text('You will receive an email with instructions '\
                                'on how to reset your password in a few minutes')
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  feature 'with an non-existent email' do
    scenario 'does not send a reset password email' do
      visit new_user_password_path

      fill_in 'Email', with: 'non-existing-email@example.com'
      click_on 'Send me reset password instructions'

      expect(page).to have_text('Email not found')
    end
  end
end
