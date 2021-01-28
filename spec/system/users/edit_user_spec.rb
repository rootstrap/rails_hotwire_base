# frozen_string_literal: true

require 'rails_helper'

feature 'Edit user' do
  let(:new_email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 8) }
  let!(:user) { create(:user, password: password) }
  let(:edit_user_page) { PageObjects::EditUser.new }

  feature 'being logged out' do
    before do
      edit_user_page
    end

    scenario 'can not access page' do
      expect(page).to have_text('You need to sign in or sign up before continuing')
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  feature 'being logged in' do
    before do
      sign_in(user)
      edit_user_page.submit(new_email, password)
    end

    scenario 'can change the user data' do
      expect(page).to have_text(
        'You updated your account successfully, but we need to verify your new email address'
      )
      expect(page).to have_current_path(root_path)
    end
  end
end
