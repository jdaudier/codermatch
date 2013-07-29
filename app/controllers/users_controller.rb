class UsersController < ApplicationController

  def show
    @id = params[:id] #@id is not a number but the GitHub login name
    @user = User.find_by_name(params[:id])
  end

  def notify
  	# if !params[:data][:content].empty?
  		#
  	# end
  end

  def destroy
    # @user = User.find_by_login(params[:id])
    @user = @current_user
    @user.destroy
    session[:current_user] = nil
    redirect_to root_path
  end

end