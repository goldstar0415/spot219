server '104.131.114.11', port: 22, roles: [:web, :app, :db], primary: true, user: 'root'

set :application, 'turkish_spot'
set :stage,     :production
set :branch,    :develop
set :deploy_to, "/home/apps/#{fetch(:application)}"

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
# set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/apps/#{fetch(:application)}"

# set :puma_rackup, -> { File.join(current_path, 'config.ru') }
# set :puma_state, -> { File.join(shared_path, 'tmp', 'pids', 'puma.state') }
# set :puma_pid, -> { File.join(shared_path, 'tmp', 'pids', 'puma.pid') }
set :puma_bind, -> { File.join("unix://#{shared_path}", 'tmp', 'sockets', "#{fetch(:application)}-puma.sock") }
# set :puma_conf, -> { File.join(shared_path, 'puma.rb') }
# set :puma_access_log, -> { File.join(shared_path, 'log', 'puma_access.log') }
# set :puma_error_log, -> { File.join(shared_path, 'log', 'puma_error.log') }
# set :puma_role,               :app
# set :puma_env,                fetch(:rack_env, fetch(:rails_env, 'production'))
# set :ssh_options,             forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub)
# set :puma_preload_app,        true
# set :puma_prune_bundler, true
# set :puma_worker_timeout,     nil
set :puma_init_active_record, true # Change to true if using ActiveRecord
