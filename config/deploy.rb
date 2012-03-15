set :user, "root"
set :use_sudo, false

default_run_options[:pty]=true

set :domain, 'rpd2012.bmstu.ru'
set :application, "RPD_12"
set :repository,  "git@github.com:I-de-ya/RPD_12.git" #{}"#{user}@#{domain}:git/#{application}.git"

set :deploy_to, "/var/www/html/#{application}"
set :deploy_via, :remote_cache

set :scm, "git"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "rpd2012.bmstu.ru"                          # Your HTTP server, Apache/etc
role :app, "rpd2012.bmstu.ru"                          # This may be the same as your `Web` server
role :db,  "rpd2012.bmstu.ru", :primary => true # This is where Rails migrations will run

set :keep_releases, 1

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems","deploy:restart"

 # If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
 	task :bundle_gems do
 		run "cd #{deploy_to}/current && bundle install"
 	end
 	desc "Populates the Production Database"
    task :seed do
    	puts "\n\n=== Populating the Production Database! ===\n\n"
      	run "cd #{current_path}; rake db:seed RAILS_ENV=production"
    end
   	task :start do ; end
   	task :stop do ; end

	task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
     
     
	namespace :db do

    end
 end