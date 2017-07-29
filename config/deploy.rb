require "mina/rails"
require "mina/git"
require "mina/rbenv"

set :application_name, "prihatin"
set :domain, "prihatin.my"
set :deploy_to, "/home/amree/prihatin"
set :repository, "git@gitlab.com:amree/prihatin.my.git"
set :branch, "master"
set :user, "amree"
set :shared_dirs, fetch(:shared_dirs, []).push("public/uploads", "tmp", "log")
set :bundle_options, -> { %{--without #{fetch(:bundle_withouts)} --binstubs ./bin --path "#{fetch(:bundle_path)}" --deployment} }

task :environment do
  invoke :"rbenv:load"
end

task :env do
  command "for LINE in `cat /#{fetch(:deploy_to)}/shared/env`; do export $LINE; done"
end

task :yarn do
  command "yarn"
end

task :setup do
  command "mkdir -p #{fetch(:deploy_to)}/shared/tmp/sockets"
  command "mkdir -p #{fetch(:deploy_to)}/shared/tmp/pids"
end

desc "Deploys the current version to the server."
task :deploy do
  invoke :env

  deploy do
    invoke :"git:clone"
    invoke :"deploy:link_shared_paths"
    invoke :"bundle:install"
    invoke :"rails:db_migrate"
    invoke :yarn
    invoke :"rails:assets_precompile"
    invoke :"deploy:cleanup"

    on :launch do
      in_path(fetch(:current_path)) do
        command %{touch tmp/restart.txt}
      end
    end
  end
end
