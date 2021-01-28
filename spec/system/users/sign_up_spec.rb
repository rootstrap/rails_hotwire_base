# frozen_string_literal: true

require 'rails_helper'

feature 'User sign up' do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 8) }
  let(:sign_un_page) { PageObjects::SignUp.new }

  feature 'with correct data' do
    before do
      sign_un_page.submit(email, password, password)
    end

    scenario 'signs up successfully' do
      expect(page).to have_text('A message with a confirmation link has been sent to your email address.')
      expect(page).to have_text('Please follow the link to activate your account')
      expect(page).to have_current_path(root_path)
    end
  end

  feature 'with incorrect data' do
    before do
      sign_un_page.submit(email, password, 'wrong_confirmation')
    end

    scenario 'fails to sign up' do
      expect(page).to have_text('1 error prohibited this user from being saved')
      expect(page).to have_text("Password confirmation doesn't match Password")
    end
  end

  feature 'with other users email' do
    let!(:user) { create(:user, email: email) }

    before do
      sign_un_page.submit(email, password, password)
    end

    scenario 'fails to sign up' do
      expect(page).to have_text('1 error prohibited this user from being saved')
      expect(page).to have_text('Email has already been taken')
    end
  end
end
