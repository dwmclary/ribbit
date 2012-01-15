class Piece < ActiveRecord::Base
  has_attached_file :photo, 
  :styles => {:large => "330x230", :medium => "210x150", :small => "90x90"},
  :storage => :s3,
  :s3_credentials => S3_CREDENTIALS,
  :path => "/:id/:style/:filename"
  
  has_many :events
  has_and_belongs_to_many :exhibits
  has_one :gallery
 
  
  self.per_page=3
  
  define_index do
    indexes accession, :sortable => true
    indexes title, :sortable => true
    indexes artist, :sortable => true
    indexes dimensions, :sortable => true
    indexes creation_date, :sortable => true
    indexes accession_date, :sortable => true
    indexes loan_date, :sortable => true
    indexes tags
    indexes packed_with
    indexes packed_in
    indexes location, :sortable => true
    indexes hanging_hardware
    indexes handling_instructions
    indexes classification
    indexes medium
    indexes framed_dimension, :sortable => true
    indexes packed_dimension
  end
  
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
