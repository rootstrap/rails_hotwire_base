# frozen_string_literal: true

require 'rails_helper'

feature 'Edit user' do
  let(:new_email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 8) }
  let!(:user) { create(:user, password: password) }
  let(:edit_user_page) { PageObjects::EditUser.new }

  feature 'being logged out' do
    scenario 'can not access page' do
      edit_user_page.visit_page

      expect(edit_user_page).to have_sign_in_required_message
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  feature 'being logged in' do
    before do
      sign_in(user)
    end

    scenario 'can change the user data' do
      edit_user_page.visit_page
      edit_user_page.fill_in_with(new_email, password)
      edit_user_page.submit

      expect(edit_user_page).to have_updated_account_message
      expect(page).to have_current_path(authenticated_root_path)
    end
  end
end
