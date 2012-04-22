class PiecesController < ApplicationController
  before_filter :authorize, :except => :materials
  
  def materials
    respond_to do |format|
      format.json {render :json => MATERIALS[params[:surface]]}
    end
  end
  
  def add_person
    @piece = Piece.find(params[:piece_id])
    @person = Person.find_by_name(params[:piece_person_select])
    unless @piece.people.member? @person
      @piece.people << @person
    end
    respond_to do |format|
      if @piece.save and @person.save
        format.html {redirect_to(@piece, :notice => "Person added!")}
      end
    end
  end
  
  def new
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ23456789'
    @piece = Piece.new
    @piece.accession = "#{Date.today.year}.#{current_user.id}.#{chars[rand(chars.length)].chr}"
    @piece.owner = current_user.name
    if Piece.count >= 1
      @piece.accession += ".#{Piece.count+1}"
    else
      @piece.accession += ".1"
    end
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @gallery_image = GalleryImage.new
    @hyperlink = Hyperlink.new
    @p = Piece.find(params[:id])
    @hyperlinks = @p.hyperlinks
    @artist = Artist.find(@p.artist_id) unless @p.artist_id.nil?
    respond_to do |format|
      format.html
    end
  end
  
  def index
    @pieces = Piece.paginate(:page => params[:page])
    # @pieces = Piece.all
    @workspace = [] if session[:workspace].nil?
    @workspace = Piece.find(session[:workspace].uniq) unless session[:workspace].nil?
    @event = Event.new
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @artist = Artist.find_by_name(params[:piece][:artist])
    params[:piece][:artist] = @artist
    @piece = Piece.new(params[:piece])
    @piece.user_id = current_user.id
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
    params[:piece][:artist] = Artist.find_by_name(params[:piece][:artist])
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
    
    @workspace = [] if session[:workspace].nil?
    @workspace = Piece.find(session[:workspace].uniq) unless session[:workspace].nil?
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
    @piece = Piece.find(params[:id])
    @piece.destroy
    respond_to do |format|
      format.html {redirect_to(pieces_path, :alert => "Piece deleted!")}
    end
  end
  
end
