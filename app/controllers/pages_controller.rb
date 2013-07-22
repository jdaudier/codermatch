class PagesController < ApplicationController

  def new
    @user = User.new
    @language = Language.new
    @level = Level.new
  end

  def signup
    # Initializes an arbiter to update the current user using the form inputs and initiate the search
    arbiter = NewDeveloperArbiter.new( params[:signup], @current_user ) 
    # @current_user is passed in during the creation of the arbiter (new_developer_arbiter.rb)
    arbiter.process
    redirect_to arbiter.search
  end
end

