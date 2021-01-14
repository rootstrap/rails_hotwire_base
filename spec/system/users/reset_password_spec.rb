# frozen_string_literal: true

require 'rails_helper'

feature 'User reset password' do
  let!(:user) { create(:user) }

  feature 'with an existing email' do
    scenario 'shows message that an email was sent if email address exists' do
      visit new_user_password_path

      fill_in 'Email', with: user.email
      click_on 'Send me reset password instructions'

      expect(page).to have_text('If your email address exists in our database, '\
                                'you will receive a password recovery link at your email address '\
                                'in a few minutes')
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  feature 'with an non-existent email' do
    scenario 'shows message that an email was sent if email address exists' do
      visit new_user_password_path

      fill_in 'Email', with: 'non-existing-email@example.com'
      click_on 'Send me reset password instructions'

      expect(page).to have_text('If your email address exists in our database, '\
                                'you will receive a password recovery link at your email address '\
                                'in a few minutes')
    end
  end
end
