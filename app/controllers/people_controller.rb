require 'json'

class PeopleController < ApplicationController
  before_filter :authorize, :skip => :index  
  
  def new
    @person = Person.new
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @p = Person.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end

  
  def create
    @person = Person.create(params[:person])
    respond_to do |format|
      if @person.save
        format.html {redirect_to(@person, :notice => "Person created!")}
      else
        format.html {render :action => "new", :alert => "Person not created: try again"}
      end
    end
  end
  
  def index
    if params[:q]
      @people = Person.all(:conditions => ["name like ?", "%#{params[:q]}%" + '%'])
    else
      @people = Person.all
    end
    puts "returning #{@people.map(&:name)}"
    respond_to do |format|
      format.html
      format.js {render :json => @people.map(&:name)}
    end
  end
  
end
