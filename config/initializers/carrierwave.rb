CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['aws_access_key_id'],
    aws_secret_access_key: ENV['aws_secret_access_key']
  }
  config.fog_directory = "team_beer-#{Rails.env}"
  config.fog_public = false
end
