class Event < ActiveRecord::Base
    has_attached_file :photo, :styles => {:large => "330x230", :medium => "210x150", :small => "90x90"},
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => "/:style/:id/:filename"
    
    belongs_to :piece
end
