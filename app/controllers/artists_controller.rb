require 'json'
class ArtistsController < ApplicationController
  before_filter :authorize, :skip => :index  

  def index
    if params[:q]
      @artists = Artist.all(:conditions => ["name like ?", "%#{params[:q]}%" + '%'])
    else
      @artists = Artist.all
    end
    puts "returning #{@artists.map(&:name)}"
    
    respond_to do |format|
      format.html
      format.js {render :json => @artists.map(&:name)}
    end
  end
  
  def show
    @a = Artist.find(params[:id])
    @hyperlink = Hyperlink.new
    @hyperlinks = @a.hyperlinks
    respond_to do |format|
      format.html
    end
  end
  
  def new
    @artist = Artist.new
    
    respond_to do |format|
      format.html
    end
    
  end
  
  def create
    @artist = Artist.new(params[:artist])
    respond_to do |format|
      if @artist.save
        format.html {redirect_to(@artist, :notice => "Artist created!")}
      else
        format.html {render :action => "new", :alert => "Artist not created: try again"}
      end
    end
  end
  
  def edit
    @artist = Artist.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    respond_to do  |format|
      format.html {redirect_to(artists_path, :notice => "Artist deleted")}
    end
  end
  
  def update
    @artist = Artist.find(params[:id])
    @artist.update_attributes(params[:artist])
    respond_to do |format|
      if @artist.save!
        format.html {redirect_to @artist, :notice => "Artist updated"}
      else
        format.html {render :action => "edit", :alert => "Artist not updated"}
      end
    end
  end
  
end
