# frozen_string_literal: true

module PageObjects
  class EditUser
    include Capybara::DSL
    include Rails.application.routes.url_helpers

    def visit_page
      visit edit_user_registration_path
    end

    def fill_in_with(email, password)
      fill_in 'Email', with: email
      fill_in 'Current password', with: password
    end

    def submit
      click_on 'Update'
    end

    def has_sign_in_required_message?
      has_text?('You need to sign in or sign up before continuing')
    end

    def has_updated_account_message?
      has_text?('You updated your account successfully, but we need to verify your new email address')
    end
  end
end
