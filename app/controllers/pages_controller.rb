class PagesController < ApplicationController

  def new
    @user = User.new
    @language = Language.new
    @level = Level.new
  end

  def signup
    # Initializes an arbiter to update the current user using the form inputs and initiate the search
    # The arbiter is chillin'. He doesn't have any beef with anybody and is just tryin' to get paid. 

    arbiter = NewDeveloperArbiter.new( params[:signup], @current_user ) 
    # @current_user is passed in during the creation of the arbiter (new_developer_arbiter.rb)
    arbiter.process

    if params[:signup][:zipcode].blank?
      
    else
      redirect_to arbiter.search
    end

  end
end

