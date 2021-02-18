module OmniauthHelper
  def omniauth_provider_name(provider)
    case provider
    when :google_oauth2
      'Google'
    else
      'Unknown provider'
    end
  end

  def omniauth_provider_icon(provider)
    case provider
    when :google_oauth2
      'google'
    end
  end
end
