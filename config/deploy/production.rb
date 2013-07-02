set :rails_env, "production" 
set :branch, "master"
set :deploy_to, "/var/www/#{application}/#{rails_env}"
set :keep_release, 1 # 1 is good for staging, 2 or more is better for production
