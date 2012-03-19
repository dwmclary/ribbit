class SearchController < ApplicationController
  before_filter :authorize
  
  def show
    @workspace = [] if session[:workspace].nil?
    @workspace = Piece.find(session[:workspace].uniq) unless session[:workspace].nil?
    @event = Event.new
    if params[:q].present?
      if params[:search_by].present?
        query = "%"+params[:q]+"%"
        @q = params[:q]
        @search_by = params[:search_by]
        case params[:search_by]
        when "by_artist"
          @pieces = Piece.where("artist LIKE ?", query).paginate(:page => params[:page], :per_page => Piece.per_page)
        when "by_accession"
          @pieces = Piece.where("accession LIKE ?", query).paginate(:page => params[:page], :per_page => Piece.per_page)
        when "by_accession_date"
          @pieces = Piece.where("accession_date LIKE ?", query).paginate(:page => params[:page], :per_page => Piece.per_page)  
        when "by_title"
          @pieces = Piece.where("title LIKE ?", query).paginate(:page => params[:page], :per_page => Piece.per_page)  
        when "by_date"
          @pieces = Piece.where("creation_date LIKE ?", query).paginate(:page => params[:page], :per_page => Piece.per_page)  
        when "by_medium"
          @pieces = Piece.where("medium LIKE ?", query).paginate(:page => params[:page], :per_page => Piece.per_page)  
        when "by_classification"
          @pieces = Piece.where("classification LIKE ?", query).paginate(:page => params[:page], :per_page => Piece.per_page)
        when "by_location"
          @pieces = Piece.where("location LIKE ?", query).paginate(:page => params[:page], :per_page => Piece.per_page)          
        end
      else
        query = "%"+params[:q]+"%"
        @pieces = Piece.where("artist LIKE ? OR accession LIKE ? OR accession_date LIKE ?
        OR title LIKE ? OR creation_date LIKE ? or medium LIKE ? OR classification LIKE ?
        OR location LIKE ?", query, query, query, query, query, query, query, query).paginate(:page => params[:page], :per_page => Piece.per_page)
        # @pieces = Piece.search params[:q],  :page => params[:page], :per_page => Piece.per_page
        @q = params[:q]
      end
    else
      @pieces = []
    end
    respond_to do |format|
      if params.member? :commit
        format.html
      else
        format.html {render :show, :layout => false}
      end
    end
  end
  
end
