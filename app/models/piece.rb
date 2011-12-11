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
  
  def parse_dimensions(params)
    if params[:piece_dimensions_h] != "h" and params[:piece_dimensions_w] != "w"
      dims = [params[:piece_dimensions_h],params[:piece_dimensions_w]]
      if params[:piece_dimensions_d] != "d"
        dims << params[:piece_dimensions_d]
      end
      piece_dimensions = dims.join("x")
      @dimensions = piece_dimensions
    end
    
    #check the packed dimensions:
    if params[:packed_dimension_h] != "h" and params[:packed_dimension_w] != "w"
      dims = [params[:packed_dimension_h],params[:packed_dimension_w]]
      if params[:packed_dimension_d] != "d"
        dims << params[:packed_dimension_d]
      end
      packed_dimensions = dims.join("x")
      @packed_dimension = packed_dimensions
    end
    
    #checked the framed dimensions

    if params[:framed_dimension_h] != "h" and params[:framed_dimension_w] != "w"
      dims = [params[:framed_dimension_h],params[:framed_dimension_w]]
      if params[:framed_dimension_d] != "d"
        dims << params[:framed_dimension_d]
      end
      framed_dimensions = dims.join("x")
      @framed_dimension = framed_dimensions
    end
  end
end
