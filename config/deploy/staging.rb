set :application, 'contribhub-staging'

set :cap_user, ENV['cap_user']
set :role, ["#{fetch(:cap_user)}@staging.contribhub.com"]

role :app, fetch(:role)
role :web, fetch(:role)
role :db,  fetch(:role)

server 'staging.contribhub.com', user: fetch(:cap_user), roles: %w{web app}

set :deploy_to, ENV['staging_deploy_path']
set :ssh_options, { forward_agent: true }
