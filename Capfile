require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
require 'capistrano/rails'
require 'capistrano/rvm'
require 'capistrano/puma'

install_plugin Capistrano::SCM::Git
# install_plugin Capistrano::Puma
# install_plugin Capistrano::Puma::Nginx
# install_plugin Capistrano::Puma::Systemd
# install_plugin Capistrano::Sidekiq
# install_plugin Capistrano::Sidekiq::Systemd

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
