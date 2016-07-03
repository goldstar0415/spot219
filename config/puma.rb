#!/usr/bin/env puma
# require 'dotenv'
# Dotenv.load

environment ENV['RAILS_ENV'] || 'development'

unless ENV['RAILS_ENV'] == 'development'
  daemonize true

  pidfile '/home/deployer/apps/turkish_spot/shared/tmp/pids/puma.pid'

  state_path '/home/deployer/apps/turkish_spot/shared/tmp/sockets/puma.state'

  bind 'unix:///home/deployer/apps/turkish_spot/shared/tmp/sockets/puma.sock'
end

threads 8, 32

workers Integer(ENV['CONCURRENCY'] || 2)

# preload_app!

unless ENV['RAILS_ENV'] == 'development'
  activate_control_app 'unix:///home/deployer/apps/turkish_spot/shared/tmp/sockets/pumactl.sock'
end

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
