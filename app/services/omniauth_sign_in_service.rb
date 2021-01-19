class OmniauthSignInService
  def find_or_create_user!(access_token:)
    data = access_token.info

    User.find_or_create_by!(email: data['email']) do |user|
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
