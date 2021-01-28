# frozen_string_literal: true

module PageObjects
  class EditUser
    include Capybara::DSL
    include Rails.application.routes.url_helpers

    def initialize
      visit edit_user_registration_path
    end

    def submit(email, password)
      fill_in 'Email', with: email
      fill_in 'Current password', with: password
      click_on 'Update'
    end
  end
end
