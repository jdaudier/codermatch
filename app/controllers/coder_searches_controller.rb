class CoderSearchesController < ApplicationController
  #Create the pair search
  def show
    if !@current_user
      redirect_to "/"
    else
      # .Joins brings in the language table so we can search in both
      # .where('users.id != ?', @current_user.id) means you will be excluded from the search. The '?' is for security reasons and @current_user.id is passed in to replace ? in usage 
      if @current_user.geocoded?
        @results = @current_user.nearbys(20).where('languages.language' => params[:language], :level => params[:level]).joins(:language).where('users.id != ?', @current_user.id)
      end
    end
  end

end

