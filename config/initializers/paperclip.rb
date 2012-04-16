# If an s3.yml file exists, use the key, secret key, and bucket values from there.
# Otherwise, pull them from the environment.

Paperclip::Attachment.interpolations[:piece_id] = proc do |attachment, style|
  attachment.instance.piece_id # or whatever you've named your User's login/username/etc. attribute
end

Paperclip::Attachment.interpolations[:gallery_id] = proc do |attachment, style|
  attachment.instance.gallery_id # or whatever you've named your User's login/username/etc. attribute
end

if File.exists?("#{Rails.root}/config/s3.yml")
  S3_CREDENTIALS = YAML.load_file Rails.root.join("config/s3.yml")
  if Rails.env=="production"
    S3_CREDENTIALS[:bucket] = "ribbitheroku"
  end
else
  S3_CREDENTIALS = { :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'], :bucket => "ribbitphotos"} 
end