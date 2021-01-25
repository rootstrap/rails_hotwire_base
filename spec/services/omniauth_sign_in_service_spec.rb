require 'rails_helper'

describe OmniauthSignInService do
  describe '#find_or_create_user!' do
    it 'finds a user when the email has already been registered' do
      user = create(:user)
      auth_info = { 'email' => user.email }

      expect(OmniauthSignInService.new.find_or_create_user!(auth_info: auth_info)).to eq(user)
    end

    it 'creates a new user if the email is not registered' do
      auth_info = { 'email' => 'new@user.com' }

      expect {
        OmniauthSignInService.new.find_or_create_user!(auth_info: auth_info)
      }.to change(User, :count).by(1)
    end

    it 'assigns the correct attributes when creating a new user' do
      auth_info = { 'email' => 'new@user.com' }

      user = OmniauthSignInService.new.find_or_create_user!(auth_info: auth_info)

      expect(user.email).to eq('new@user.com')
    end
  end
end
