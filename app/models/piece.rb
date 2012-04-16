class Piece < ActiveRecord::Base
  has_attached_file :photo, 
  :styles => {:xlarge => "495x345", :large => "330x230", :medium => "210x150", :small => "90x90"},
  :storage => :s3,
  :s3_credentials => S3_CREDENTIALS,
  :path => "/:id/:style/:filename"
  
  has_many :events
  has_and_belongs_to_many :exhibits
  has_one :gallery
  has_and_belongs_to_many :people
  belongs_to :artist
  
  self.per_page=9

  
  def self.classifications
    ["Sculpture",
    "Painting",
    "Drawing",
    "Print",
    "Photograph",
    "Mixed media",
    "Scroll",
    "Book",
    "Portfolio",
    "Installation",
    "Fiber Art",
    "Light art",
    "Furnishing",
    "Ephemera",
    "Sound Art",
    "Video"]
  end

    
  def add_gallery
    g = Gallery.new
    g.piece_id = self.id
    g.save!
  end
  

end
