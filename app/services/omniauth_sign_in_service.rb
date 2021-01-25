class OmniauthSignInService
  def find_or_create_user!(auth_info:)
    User.find_or_create_by!(email: auth_info['email']) do |user|
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
