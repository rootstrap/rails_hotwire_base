# frozen_string_literal: true

module PageObjects
  class ResetPassword
    include Capybara::DSL
    include Rails.application.routes.url_helpers

    def visit_page
      visit new_user_password_path
    end

    def fill_in_with(email)
      fill_in 'Email', with: email
    end

    def submit
      click_on 'Send me reset password instructions'
    end

    def has_password_recovery_email_sent_message?
      has_text?(
        'If your email address exists in our database, '\
        'you will receive a password recovery link at your email address '\
        'in a few minutes'
      )
    end
  end
end
