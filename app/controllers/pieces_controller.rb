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
    @workspace = Piece.find(session[:workspace].uniq) 
    @event = Event.new
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
  
  def add_to_workspace
    piece_id = params[:piece_id].split(":").last
    (session[:workspace] ||= []) << piece_id
    render :nothing => true
  end
  
  def remove_from_workspace
    piece_id = params[:piece_id].split(":").last
    session[:workspace].delete(piece_id)    
    render :nothing => true
  end
  
  def event_on_workspace
    @events = []
    @workspace = session[:workspace].uniq
    @p = Piece.find(@workspace.first)
    @workspace.each do |piece|
      event = Event.new(params[:event])
      p = Piece.find(piece)
      event.piece_id = p.id
      event.created_by = current_user.name
      event.save!
      @events << event
    end
    case @events.first.event_type
    when "Location Change"
      @modal_form = "workspace_location"
    when "Condition Update"
      @modal_form = "workspace_condition"
    when "Packing Change"
      @modal_form = "workspace_packing"
    else
      @modal_form = nil
    end
    
    respond_to do |format|
      if @workspace.empty?
        format.html {redirect_to pieces_path, :alert => "Workspace is empty!"}
      elsif @modal_form.nil?
        format.html {redirect_to(pieces_path, :notice => "Event created!")}
      else
        format.html {render :action => "update_objects"}
      end
    end
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
  
  def update_workspace
    
    @workspace = Piece.find(session[:workspace].uniq) 
    all_saved = true
    for p in @workspace
      p.update_attributes(params[:piece])
      this_saved = p.save
      all_saved = false if not this_saved
    end

    respond_to do |format|
      if all_saved
        format.html {redirect_to(pieces_path, :notice => "Objects updated!")}
      else
        format.html {redirect_to(pieces_path, :alert => "Objects not updated!")}
      end
    end
  end

  def destroy
  end
  
end
