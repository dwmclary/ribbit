class SearchController < ApplicationController
  before_filter :authorize
  def show
    @workspace = [] if session[:workspace].nil?
    @workspace = Piece.find(session[:workspace].uniq) unless session[:workspace].nil?
    @event = Event.new
    
    if params[:q].present?
      @pieces = Piece.search params[:q],  :page => params[:page], :per_page => Piece.per_page
    else
      @pieces = []
    end
    
    respond_to do |format|
      format.html
    end
  end
  
end
