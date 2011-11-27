class Event < ActiveRecord::Base
    has_attached_file :photo, :styles => {:large => "330x230", :medium => "210x150", :small => "90x90"}
    belongs_to :piece
end
