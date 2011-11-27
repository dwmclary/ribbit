class Piece < ActiveRecord::Base
  has_attached_file :photo, :styles => {:large => "330x230", :medium => "210x150", :small => "90x90"}
  has_many :events
end
