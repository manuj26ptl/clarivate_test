Unsplash.configure do |config|
  config.application_access_key =  ENV['USPLASH_ACCES_KEY']
  config.application_secret = ENV['UNSPLASH_SECRET_KEY'] 
  config.application_redirect_uri = "https://your-application.com/oauth/callback"
  config.utm_source =  ENV['APP_NAME']
end