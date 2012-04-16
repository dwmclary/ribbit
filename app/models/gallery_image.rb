class GalleryImage < ActiveRecord::Base
  has_attached_file :photo, 
  :styles => {:xlarge => "495x345", :large => "330x230", :medium => "210x150", :small => "90x90"},
  :storage => :s3,
  :s3_credentials => S3_CREDENTIALS,
  :path => "/galleries/:gallery_id/:id/:style/:filename"
  
  belongs_to :gallery
  def to_jq_upload
    {
    }
  end
end
