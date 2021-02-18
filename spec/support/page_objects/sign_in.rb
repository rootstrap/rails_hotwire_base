# frozen_string_literal: true

module PageObjects
  class SignIn
    include Capybara::DSL
    include Rails.application.routes.url_helpers

    def visit_page
      visit new_user_session_path
    end

    def fill_in_with(email, password)
      fill_in 'Email', with: email
      fill_in 'Password', with: password
    end

    def submit
      click_on 'Sign in'
    end

    def has_success_message?
      has_text?('Signed in successfully')
    end

    def has_invalid_credentials_error_message?
      has_text?('Invalid Email or password')
    end

    def has_unconfirmed_email_error_message?
      has_text?('You have to confirm your email address before continuing')
    end
  end
end
