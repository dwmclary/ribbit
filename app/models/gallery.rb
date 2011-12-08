class Gallery < ActiveRecord::Base
  belongs_to :piece
  has_many :gallery_images
end
