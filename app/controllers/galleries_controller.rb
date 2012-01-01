class GalleriesController < ApplicationController
  before_filter :authorize  
  def show
    @piece = Piece.find(params[:piece_id])
    @gallery = @piece.gallery
    respond_to do |format|
      format.html
    end
  end
  
end
