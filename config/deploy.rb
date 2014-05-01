# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'contribhub'
set :repo_url, 'git@github.com:orendon/contrib-hub.git'

# Default branch is :master
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :scm, :git
set :format, :pretty

# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

set :linked_files, %w{config/database.yml config/secrets.yml .env}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :keep_releases, 10
set :rbenv_ruby, '2.1.1'

set :hipchat_token, ENV['hipchat_token']
set :hipchat_room_name, "ContribHub"
set :hipchat_announce, true

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # execute "/etc/init.d/nginx restart"
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
