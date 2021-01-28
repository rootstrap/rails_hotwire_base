# frozen_string_literal: true

module PageObjects
  class ResetPassword
    include Capybara::DSL
    include Rails.application.routes.url_helpers

    def initialize
      visit new_user_password_path
    end

    def submit(email)
      fill_in 'Email', with: email
      click_on 'Send me reset password instructions'
    end
  end
end
