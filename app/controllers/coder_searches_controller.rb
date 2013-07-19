class CoderSearchesController < ApplicationController
  #Create the pair search
  def show
    if !@current_user
      redirect_to "/"
    else
      # @results = User.where('languages.language' => params[:language], :level => params[:level], :zipcode => params[:zipcode]).joins(:language).where('users.id != ?', @current_user.id)

      if @current_user.geocoded?
        @results = @current_user.nearbys(20).where('languages.language' => params[:language], :level => params[:level]).joins(:language).where('users.id != ?', @current_user.id)
      end
    end
  end

end

