class PagesController < ApplicationController

  def new
    @user = User.new
    @language = Language.new
    @level = Level.new
  end

  def create

  end

end
