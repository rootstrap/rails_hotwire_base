require 'rails_helper'

describe OmniauthHelper do
  describe 'omniauth_provider_name' do
    it 'returns the humanized name for GoogleOauth2' do
      expect(omniauth_provider_name(:google_oauth2)).to eq('Google')
    end

    it 'returns unknown for any other providers' do
      expect(omniauth_provider_name(:facebook_or_something)).to eq('Unknown provider')
    end
  end
end
