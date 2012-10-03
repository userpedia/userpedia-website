require 'bundler/capistrano'
require 'rvm/capistrano'

set :branch, "master"

role :web, "userpedia.org"
role :app, "userpedia.org"
role :db,  "userpedia.org", :primary => true

set :user, "ubuntu"
set :application, "userpedia"
set :deploy_to, "/data/#{application}"

set :repository, "git://github.com/userpedia/userpedia-website.git"
set :scm, :git

set :rvm_bin_path, "/usr/local/rvm/bin/"
before 'deploy:setup', 'rvm:install_rvm'
namespace :deploy do
  task :start do ; end
  task :end do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "god restart #{application}"
  end
end
