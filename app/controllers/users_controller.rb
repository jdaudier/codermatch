class UsersController < ApplicationController
  def show
    
  end


 def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to @user
    else
      render action: 'new'
    end
  end
end