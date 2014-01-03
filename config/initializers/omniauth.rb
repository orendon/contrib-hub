Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :github, '6326b3fb4d56e37d85d0', '8c203446caedec8fd08d9a1c60067e5da08257ae'
  else
    provider :github, '0b352782a5c08bb12c7e', 'dfb074b732d1694c19f638cfc2236aba7ba567cc'
  end
end

OmniAuth.config.on_failure = HomeController.action(:index)
