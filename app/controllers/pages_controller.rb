class PagesController < ApplicationController

  def new
    @user = User.new
    @language = Language.new
    @level = Level.new
  end

  def signup
    arbiter = NewDeveloperArbiter.new( params[:signup], @current_user )
    arbiter.process
    redirect_to arbiter.search
  end
end

