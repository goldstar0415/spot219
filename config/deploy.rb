# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'Turkish Spot'
set :repo_url, 'git@bitbucket.org:lelacag/turkish-spot.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

set :linked_files, %w(config/database.yml config/application.yml)
set :linked_dirs,  %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system  config/locales)

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute "cd #{current_path} && touch tmp/restart.txt"
      execute "cd #{current_path} && RAILS_ENV=production bundle exec bin/delayed_job restart"
      execute "cd #{current_path} && RAILS_ENV=production bundle exec rake sunspot:solr:start"
    end
  end

  # after :finishing,    :compile_assets
  after :finishing,    :cleanup
  after :finishing,    :restart
end
