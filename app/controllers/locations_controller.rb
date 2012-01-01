class LocationsController < ApplicationController
  before_filter :authorize
  def show
    @l = Location.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  
  def new
    @location = Location.new
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @location = Location.new(params[:location])
    respond_to do |format|
      if @location.save
        format.html {redirect_to(@location, :notice => "Location created!")}
      else
        format.html {render :action => "new", :alert => "Location not created: try again"}
      end
    end
  end
  
end
