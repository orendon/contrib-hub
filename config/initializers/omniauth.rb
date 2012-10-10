Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, '0b352782a5c08bb12c7e', 'dfb074b732d1694c19f638cfc2236aba7ba567cc'
end