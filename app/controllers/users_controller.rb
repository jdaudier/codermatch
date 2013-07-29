class UsersController < ApplicationController

  def show
    @id = params[:id]
    @user = User.find_by_name(params[:id])
  end

  def notify
  	# if !params[:data][:content].empty?
  		#
  	# end
  end

end