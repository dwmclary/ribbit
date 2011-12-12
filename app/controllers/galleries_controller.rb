class GalleriesController < ApplicationController
  
  def show
    @piece = Piece.find(params[:piece_id])
    @gallery = @piece.gallery
    respond_to do |format|
      format.html
    end
  end
  
end
