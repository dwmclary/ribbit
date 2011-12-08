class Piece < ActiveRecord::Base
  has_attached_file :photo, 
  :styles => {:large => "330x230", :medium => "210x150", :small => "90x90"},
  :storage => :s3,
  :s3_credentials => S3_CREDENTIALS,
  :path => "/:id/:style/:filename"
  
  has_many :events
  has_and_belongs_to_many :exhibits
  has_one :gallery
 
  PAINTING_MEDIA = ["Oil","Watercolor","Acrylic"]
  PAINTING_SURFACES = ["Panel", "Canvas", "Linen", "Paper", "Metal"]
  PRINTING_SURFACES = ["Lithograph", "Screenprint", "Blockprint"]
  def self.classifications
    ["Collage",
    "Drawing",
    "Fiber Art",
    "Light Art",
    "Film",
    "Installation",
    "Mixed Media",
    "Painting",
    "Pastel",
    "Photograph",
    "Print",
    "Sculpture",
    "Book",
    "Scroll"]
  end

  
  def self.media
    media_types = []
    PAINTING_MEDIA.each do |p|
     PAINTING_SURFACES.each do |s| 
       media_types << "#{p} on #{s}"
     end
    end
    media_types += PRINTING_SURFACES
    media_types
  end
end
