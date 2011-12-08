# If an s3.yml file exists, use the key, secret key, and bucket values from there.
# Otherwise, pull them from the environment.

if File.exists?("#{Rails.root}/config/s3.yml")
  S3_CREDENTIALS = YAML.load_file Rails.root.join("config/s3.yml")
else
  S3_CREDENTIALS = { :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'], :bucket => "ourbucket"} 
end