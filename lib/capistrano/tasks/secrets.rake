namespace :secrets do
  desc 'Copy secrets from heroku app to application'
  task 'copy' do
    settings = `heroku config --app #{fetch(:secrets_app_name)} | grep '#{fetch(:secrets_app_pattern)}'`
    settings.gsub!(/\s+/, ' ')
    on roles :app do
      upload! StringIO.new(settings), shared_path.join('.env')
    end
  end

  desc 'Ensure shared .env file'
  task 'check_dotenv' do
    on roles :app do
      unless test("[ -f #{shared_path.join('.env')} ]")
        invoke("secrets:copy")
      end
    end
  end
end
after "deploy:check:directories", "secrets:check_dotenv"