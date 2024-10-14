# config valid for current version and patch releases of Capistrano
lock "~> 3.19.0"

set :application, "homey"
set :repo_url, "git@github.com:amilhoranza/homey-tech-test.git"
set :deploy_to, "/var/www/homey"

append :linked_files, "config/database.yml", "config/storage.yml", "config/master.key", "config/local_env.yml"
append :linked_dirs, "log", "tmp"

set :keep_releases, 5
set :migration_role, :app

set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"

set :nginx_sites_available_path, "/etc/nginx/sites-available"
set :nginx_sites_enabled_path, "/etc/nginx/sites-enabled"

set :rvm_ruby_version, '3.2.2'

namespace :puma do
  desc 'Create Puma dirs'
  task :create_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  desc "Restart Nginx"
  task :nginx_restart do
    on roles(:app) do
      execute "sudo service nginx restart"
    end
  end

  before :start, :create_dirs
  after :start, :nginx_restart
end

set :branch, 'main'
set :server_address, '198.211.117.61'

ask(:password, nil, echo: false)
server fetch(:server_address), user: "deploy", roles: %w{app db web}

set :nginx_server_name, fetch(:server_address)
set :puma_preload_app, true

# after 'deploy:published', 'sidekiq:restart'

# namespace :sidekiq do
#   desc 'Reiniciar o Sidekiq'
#   task :restart do
#     on roles(:app) do
#       execute :sudo, :systemctl, 'restart', 'sidekiq'
#     end
#   end
# end
