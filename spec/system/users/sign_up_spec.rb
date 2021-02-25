# frozen_string_literal: true

require 'rails_helper'

feature 'User sign up' do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 8) }
  let(:sign_un_page) { PageObjects::SignUp.new }

  feature 'with correct data' do
    scenario 'signs up successfully' do
      sign_un_page.visit_page
      sign_un_page.fill_in_with(email, password, password)
      sign_un_page.submit

      expect(sign_un_page).to have_confirmation_link_sent_message
      expect(sign_un_page).to have_follow_the_link_message
      expect(page).to have_current_path(authenticated_root_path)
    end
  end

  feature 'with incorrect data' do
    scenario 'fails to sign up' do
      sign_un_page.visit_page
      sign_un_page.fill_in_with(email, password, 'wrong_confirmation')
      sign_un_page.submit

      expect(sign_un_page).to have_user_not_saved_error_message
      expect(sign_un_page).to have_password_confirmation_not_match_error_message
    end
  end

  feature 'with other users email' do
    let!(:user) { create(:user, email: email) }

    scenario 'fails to sign up' do
      sign_un_page.visit_page
      sign_un_page.fill_in_with(email, password, password)
      sign_un_page.submit

      expect(sign_un_page).to have_user_not_saved_error_message
      expect(sign_un_page).to have_email_already_taken_error_message
    end
  end
end
