class UsersController < ApplicationController
  before_filter :authorize
  
  def index
    @users = User.paginate(:page => params[:page], :per_page => 10)
    
    respond_to do |format|
      format.html
    end
    
  end
  
  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_to do |format|
      if @user.save
        format.html {redirect_to("/users", :notice => "User updated!")}
      else
        format.html {redirect_to("/users", :warn => "Update failed!")}
      end
    end
  end
  
  def destroy
  end
  
end
