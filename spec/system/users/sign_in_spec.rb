# frozen_string_literal: true

require 'rails_helper'

feature 'User sign in' do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 8) }
  let(:sign_in_page) { PageObjects::SignIn.new }

  feature 'when user has confirmed account' do
    let!(:user) { create(:user, email: email, password: password) }

    feature 'with correct credentials' do
      scenario 'signs in successfully' do
        sign_in_page.visit_page
        sign_in_page.fill_in_with(email, password)
        sign_in_page.submit

        expect(sign_in_page).to have_success_message
        expect(page).to have_current_path(authenticated_root_path)
      end
    end

    feature 'with incorrect credentials' do
      scenario 'fails to sign in' do
        sign_in_page.visit_page
        sign_in_page.fill_in_with(email, 'wrong_password')
        sign_in_page.submit

        expect(sign_in_page).to have_invalid_credentials_error_message
        expect(page).to have_current_path(new_user_session_path)
      end
    end
  end

  feature 'when user has unconfirmed account' do
    let!(:user) { create(:user, email: email, password: password, confirmed_at: nil) }

    scenario 'fails to sign in' do
      sign_in_page.visit_page
      sign_in_page.fill_in_with(email, password)
      sign_in_page.submit

      expect(sign_in_page).to have_unconfirmed_email_error_message
      expect(page).to have_current_path(new_user_session_path)
    end
  end
end
