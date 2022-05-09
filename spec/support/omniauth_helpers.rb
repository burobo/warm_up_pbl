module OmniAuthHelpers
  def set_omniauth(service = :google_oauth2)
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[service] = OmniAuth::AuthHash.new(
      {
        provider: service.to_s,
        uid: '1234',
        info: {
          name: Faker::Name.name,
          email: Faker::Internet.email
        }
      }
    )
  end
end
