require 'rails_helper'

describe OmniauthSignInService do
  describe '#find_or_create_user!' do
    it 'finds a user when the email has already been registered' do
      user = create(:user)
      token = double(:access_token, info: { 'email' => user.email })

      expect(OmniauthSignInService.new.find_or_create_user!(access_token: token)).to eq(user)
    end

    it 'creates a new user if the email is not registered' do
      token = double(:access_token, info: { 'email' => 'new@user.com' })

      expect {
        OmniauthSignInService.new.find_or_create_user!(access_token: token)
      }.to change(User, :count).by(1)
    end

    it 'assigns the correct attributes when creating a new user' do
      token = double(:access_token, info: { 'email' => 'new@user.com' })

      user = OmniauthSignInService.new.find_or_create_user!(access_token: token)

      expect(user.email).to eq('new@user.com')
    end
  end
end
