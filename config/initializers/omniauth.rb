Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  else
    provider :github, '0b352782a5c08bb12c7e', 'dfb074b732d1694c19f638cfc2236aba7ba567cc'
  end
end

OmniAuth.config.on_failure = HomeController.action(:index)
