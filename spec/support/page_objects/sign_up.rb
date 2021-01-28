# frozen_string_literal: true

module PageObjects
  class SignUp
    include Capybara::DSL
    include Rails.application.routes.url_helpers

    def visit_page
      visit new_user_registration_path
    end

    def fill_in_with(email, password, password_confirmation)
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password_confirmation
    end

    def submit
      click_on 'Sign up'
    end

    def has_confirmation_link_sent_message?
      has_text?('A message with a confirmation link has been sent to your email address.')
    end

    def has_follow_the_link_message?
      has_text?('Please follow the link to activate your account')
    end

    def has_user_not_saved_error_message?
      has_text?('1 error prohibited this user from being saved')
    end

    def has_password_confirmation_not_match_error_message?
      has_text?("Password confirmation doesn't match Password")
    end

    def has_email_already_taken_error_message?
      has_text?('Email has already been taken')
    end
  end
end
