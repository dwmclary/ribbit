class PiecesController < ApplicationController
  
  def new
    @piece = Piece.new
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @p = Piece.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  
  def index
    @pieces = Piece.all
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @piece = Piece.new(params[:piece])
    #check the piece dimensions:
    if params[:piece_dimensions_h] != "h" and params[:piece_dimensions_w] != "w"
      dims = [params[:piece_dimensions_h],params[:piece_dimensions_w]]
      if params[:piece_dimensions_d] != "d"
        dims << params[:piece_dimensions_d]
      end
      piece_dimensions = dims.join("x")
      @piece.dimensions = piece_dimensions
    end
    
    #check the packed dimensions:
    if params[:packed_dimension_h] != "h" and params[:packed_dimension_w] != "w"
      dims = [params[:packed_dimension_h],params[:packed_dimension_w]]
      if params[:packed_dimension_d] != "d"
        dims << params[:packed_dimension_d]
      end
      packed_dimensions = dims.join("x")
      @piece.packed_dimension = packed_dimensions
    end
    
    #checked the framed dimensions

    if params[:framed_dimension_h] != "h" and params[:framed_dimension_w] != "w"
      dims = [params[:framed_dimension_h],params[:framed_dimension_w]]
      if params[:framed_dimension_d] != "d"
        dims << params[:framed_dimension_d]
      end
      framed_dimensions = dims.join("x")
      @piece.framed_dimension = framed_dimensions
    end
    
    respond_to do |format|
      if @piece.save
        @piece.add_gallery
        format.html {redirect_to(@piece, :notice => "Object created!")}
      else
        format.html {render :action => "new"}
      end
    end
  end

  def edit
  end

  def update
    @piece = Piece.find(params[:id])
    @piece.update_attributes(params[:piece])
    respond_to do |format|
      if @piece.save
        format.html {redirect_to(@piece, :notice => "Object updated!")}
      else
        format.html {redirect_to(@piece, :warn => "Update failed!")}
      end
    end
  end

  def destroy
  end
  
end
