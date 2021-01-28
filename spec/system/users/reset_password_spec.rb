# frozen_string_literal: true

require 'rails_helper'

feature 'User reset password' do
  let!(:user) { create(:user) }
  let(:reset_password_page) { PageObjects::ResetPassword.new }

  feature 'with an existing email' do
    before do
      reset_password_page.submit(user.email)
    end

    scenario 'shows message that an email was sent if email address exists' do
      expect(page).to have_text(
        'If your email address exists in our database, '\
        'you will receive a password recovery link at your email address '\
        'in a few minutes'
      )
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  feature 'with an non-existent email' do
    before do
      reset_password_page.submit(user.email)
    end

    scenario 'shows message that an email was sent if email address exists' do
      expect(page).to have_text(
        'If your email address exists in our database, '\
        'you will receive a password recovery link at your email address '\
        'in a few minutes'
      )
    end
  end
end
