class EventsController < ApplicationController
  
  def new
    @piece = Piece.find(params[:piece_id])
    @event = Event.new
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @event = Event.new(params[:event])
    @p = Piece.find(params[:piece_id])
    @event.piece_id = @p.id
    @event.created_by = current_user.name
    @event.save!
    case @event.event_type
    when "Location Change"
      @modal_form = "location"
    when "Condition Update"
      @modal_form = "condition"
    when "Packing Change"
      @modal_form = "packing"
    else
      @modal_form = nil
    end
    
    respond_to do |format|
      if @modal_form.nil?
        format.html {redirect_to(@piece, :notice => "Event created!")}
      else
        format.html {render :action => "update_object"}
      end
    end
  end
  
  def show
  end
  
  def destroy
  end
  
end
