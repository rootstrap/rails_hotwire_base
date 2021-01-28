# frozen_string_literal: true

require 'rails_helper'

feature 'User sign in' do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 8) }
  let(:sign_in_page) { PageObjects::SignIn.new }

  feature 'when user has confirmed account' do
    let!(:user) { create(:user, email: email, password: password) }

    feature 'with correct credentials' do
      before do
        sign_in_page.submit(email, password)
      end

      scenario 'signs in successfully' do
        expect(page).to have_text('Signed in successfully')
        expect(page).to have_current_path(root_path)
      end
    end

    feature 'with incorrect credentials' do
      before do
        sign_in_page.submit(email, 'wrong_password')
      end

      scenario 'fails to sign in' do
        expect(page).to have_text('Invalid Email or password')
        expect(page).to have_current_path(new_user_session_path)
      end
    end
  end

  feature 'when user has unconfirmed account' do
    let!(:user) { create(:user, email: email, password: password, confirmed_at: nil) }

    before do
      sign_in_page.submit(email, password)
    end

    scenario 'fails to sign in' do
      expect(page).to have_text('You have to confirm your email address before continuing')
      expect(page).to have_current_path(new_user_session_path)
    end
  end
end
