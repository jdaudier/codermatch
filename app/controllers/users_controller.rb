class UsersController < ApplicationController

  def show
    @id = params[:id]
    @user = User.find_by_lastname(params[:id])
  end

end