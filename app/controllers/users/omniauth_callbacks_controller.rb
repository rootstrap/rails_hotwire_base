# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < ::Devise::OmniauthCallbacksController
    def google_oauth2
      @user = OmniauthSignInService.new.find_or_create_user!(auth_info: request.env['omniauth.auth'].info)

      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'Google')
      sign_in_and_redirect(@user, event: :authentication)
    rescue ActiveRecord::RecordNotFound => e
      # Removing extra as it can overflow some session stores
      session['devise.google_data'] = request.env['omniauth.auth'].except('extra')
      redirect_to(new_user_registration_url, alert: e.record.errors.full_messages.join("\n"))
    end
  end
end
