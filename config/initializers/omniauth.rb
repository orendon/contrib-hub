Rails.application.config.middleware.use OmniAuth::Builder do
  unless Rails.env.production?
    #provider :github, '0b352782a5c08bb12c7e', 'dfb074b732d1694c19f638cfc2236aba7ba567cc'
    provider :github, '9261b0541a9366e4bcb2', '880cf6b1025fa6d8f82da963fbfb5960f05e8354'
  else
    provider :github, '6326b3fb4d56e37d85d0', '8c203446caedec8fd08d9a1c60067e5da08257ae'
  end
end
