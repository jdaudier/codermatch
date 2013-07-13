class CoderSearchesController < ApplicationController
  def show
    @results = User.where('languages.language' => params[:language], :level => params[:level], :zipcode => params[:zipcode]).joins(:language) #.where('users.id != ?', @current_user.id)
  end
end

