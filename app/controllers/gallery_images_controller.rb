class GalleryImagesController < ApplicationController
  before_filter :authorize
  
  def index
  end
  
  def new
    @piece = Piece.find(params[:piece_id])
    @gallery = @piece.gallery
    @gallery_image = GalleryImage.new
    respond_to do |format|
      format.html
    end
  end
  
  def create
    params[:gallery_image][:photo] = params[:gallery_image][:photo].first
    @gallery_image = GalleryImage.new(params[:gallery_image])
    @piece = Piece.find(@gallery_image.piece_id)
    @gallery_image.gallery_id = @piece.gallery.id
    respond_to do |format|
      if @gallery_image.save
        
          format.html {  
            render :json => [@gallery_image.to_jq_upload].to_json, 
            :content_type => 'text/html',
            :layout => false
          }
          format.json {  
            render :json => [@gallery_image.to_jq_upload].to_json           
          }
      else
          render :json => [{:error => "custom_failure"}], :status => 304
      end
    end
  end
end
