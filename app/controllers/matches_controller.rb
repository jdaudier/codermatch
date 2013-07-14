class MatchesController < ApplicationController

  respond_to :json

  def index
    @matches = Match.limit(100)
  end

  def search
    render :index  
  end

  def create
    respond_with @current_user.matches.create({ 
      repo: params[:repo], 
      languages: params[:languages]
    })
  end

  def edit
    
  end

  def show
    @match = Match.find(params[:id])
  end

end