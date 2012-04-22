class HyperlinksController < ApplicationController
  
    def new
      @hyperlink = Hyperlink.new
      respond_to do |format|
        format.html
      end
    end

    def show
      @h = Hyperlink.find(params[:id])

      respond_to do |format|
        format.html
      end
    end

    def edit
      @hyperlink = Hyperlink.find(params[:id])
      respond_to do |format|
        format.html
      end
    end

    def update
      @hyperlink = Hyperlink.find(params[:id])
      @hyperlink.update_attributes(params[:hyperlink])
      respond_to do |format|
        if @hyperlink.save!
          format.html {redirect_to @hyperlink, :notice => "Person updated"}
        else
          format.html {render :action => "edit", :alert => "Person not updated"}
        end
      end

    end

    def destroy
      @hyperlink = Hyperlink.find(params[:id])
      redirect_path = nil
      @piece = nil
      @artist = nil

      unless @hyperlink.piece_id.nil?
        @piece = Piece.find(@hyperlink.piece_id)
        redirect_path = piece_path(@piece)
      end

      unless @hyperlink.artist_id.nil?
        @artist = Artist.find(@hyperlink.artist_id)
        redirect_path = artist_path(@artist)
      end
      
      @hyperlink.destroy

      respond_to do  |format|
        format.html {redirect_to(redirect_path, :notice => "Link deleted")}
      end
    end


    def create
      @hyperlink = Hyperlink.create(params[:hyperlink])
      @hyperlink.save!
      redirect_path = nil
      unless params[:hyperlink][:artist_id].empty?
        @artist = Artist.find(params[:hyperlink][:artist_id])
        @artist.hyperlinks << @hyperlink
        @artist.save!
        redirect_path = artist_path(@artist)
      end
      
      unless params[:hyperlink][:piece_id].empty?
        @piece = Piece.find(params[:hyperlink][:piece_id])
        @piece.hyperlinks << @hyperlink
        @piece.save!
        redirect_path = piece_path(@piece)
      end
          
      respond_to do |format|
        if @hyperlink.save
          if  !params[:hyperlink][:artist_id].empty?
            format.html {redirect_to(redirect_path, :notice => "Link added!")}
          end
        else
          format.html {render :action => "new", :alert => "Person not created: try again"}
        end
      end
    end

    def index
      if params[:q]
        @hyperlink = Hyperlink.all(:conditions => ["name like ?", "%#{params[:q]}%" + '%'])
      else
        @hyperlink = Hyperlink.all
      end
      respond_to do |format|
        format.html
        format.js {render :json => @hyperlink.map(&:link_text)}
      end
    end

end
