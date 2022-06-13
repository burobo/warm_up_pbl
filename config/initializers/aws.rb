unless [nil, "test"].include?(ENV["RAILS_ENV"]) do
  creds = Aws::Credentials.new(Rails.application.credentials[:aws][:access_key_id], Rails.application.credentials[:aws][:secret_access_key])

  Aws::Rails.add_action_mailer_delivery_method(
    :ses,
    credentials: creds,
    region: 'ap-northeast-1'
  )
end