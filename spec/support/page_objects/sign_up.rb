# frozen_string_literal: true

module PageObjects
  class SignUp
    include Capybara::DSL
    include Rails.application.routes.url_helpers

    def initialize
      visit new_user_registration_path
    end

    def submit(email, password, password_confirmation)
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password_confirmation
      click_on 'Sign up'
    end
  end
end
