class Artist < ActiveRecord::Base
  has_attached_file :photo, 
  :styles => {:large => "330x230", :medium => "210x150", :small => "90x90"},
  :storage => :s3,
  :s3_credentials => S3_CREDENTIALS,
  :path => "/artists/:id/:style/:filename"
  has_many :pieces
  has_and_belongs_to_many :hyperlinks
end
