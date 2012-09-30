Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, '6326b3fb4d56e37d85d0', '8c203446caedec8fd08d9a1c60067e5da08257ae', scope: "user,repo"
end