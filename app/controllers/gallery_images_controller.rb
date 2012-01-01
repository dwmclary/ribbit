class GalleryImagesController < ApplicationController
  before_filter :authorize
  def new
    @piece = Piece.find(params[:piece_id])
    @gallery = @piece.gallery
    @gallery_image = GalleryImage.new
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @gallery_image = GalleryImage.new(params[:gallery_image])
    @piece = Piece.find(params[:piece_id])
    respond_to do |format|
      if @gallery_image.save
        format.html {redirect_to(@piece, :notice => "Image added!")}
      else
        format.html {redirect_to(@piece, :alert => "Image not added!")}
      end
    end
  end
end
