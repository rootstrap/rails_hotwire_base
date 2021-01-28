# frozen_string_literal: true

module PageObjects
  class SignIn
    include Capybara::DSL
    include Rails.application.routes.url_helpers

    def initialize
      visit new_user_session_path
    end

    def submit(email, password)
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_on 'Log in'
    end
  end
end
