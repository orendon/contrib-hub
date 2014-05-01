set :application, 'contribhub'

set :cap_user, ENV['cap_user']
set :role, ["#{fetch(:cap_user)}@107.170.154.49"]

role :app, fetch(:role)
role :web, fetch(:role)
role :db,  fetch(:role)

server '107.170.154.49', user: fetch(:cap_user), roles: %w{web app}

set :deploy_to, ENV['production_deploy_path']
set :ssh_options, { forward_agent: true }
