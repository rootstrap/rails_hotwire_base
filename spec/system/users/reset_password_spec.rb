# frozen_string_literal: true

require 'rails_helper'

feature 'User reset password' do
  let!(:user) { create(:user) }
  let(:reset_password_page) { PageObjects::ResetPassword.new }

  feature 'with an existing email' do
    scenario 'shows message that an email was sent if email address exists' do
      reset_password_page.visit_page
      reset_password_page.fill_in_with(user.email)
      reset_password_page.submit

      expect(reset_password_page).to have_password_recovery_email_sent_message
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  feature 'with an non-existent email' do
    scenario 'shows message that an email was sent if email address exists' do
      reset_password_page.visit_page
      reset_password_page.fill_in_with(user.email)
      reset_password_page.submit

      expect(reset_password_page).to have_password_recovery_email_sent_message
    end
  end
end
