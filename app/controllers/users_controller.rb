class UsersController < ApplicationController

  def show
    @id = params[:id] #@id is not a number but the GitHub login name
    @user = User.find_by_login(params[:id])
    if @user.nil?
      record_not_found
    end
  end

  def destroy
    @user = @current_user
    @user.destroy
    session[:current_user] = nil #not sure about this code
    flash[:hull_logout] = true

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render nothing: true, status: 200 }
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to :back
  end

end
