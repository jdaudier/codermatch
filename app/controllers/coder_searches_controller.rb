class CoderSearchesController < ApplicationController
  #Create the pair search
  def show


    params[:per_page] ||= 10 # sets default number of results per pages
    params[:page] ||= 1 # sets default starting number for pages

    if !@current_user
      redirect_to "/"
    else
      # .Joins brings in the language table so we can search in both
      # .where('users.id != ?', @current_user.id) means you will be excluded from the search. The '?' is for security reasons and @current_user.id is passed in to replace ? in usage
      if @current_user.geocoded?

        # The .page(params[:page].to_i).per_page(params[:per_page].to_i) paginates the @results search query

        # The = ? is there to prevent SQL injection.

        @results = @current_user.nearbys(30).
          where('languages.language = ?', params[:language]).
          where('level = ?', params[:level]).joins(:language).
          where('users.id != ?', @current_user.id).page(params[:page].to_i).per_page(params[:per_page].to_i)

        @remotable_results = User.
          where('languages.language = ?', params[:language]).
          where('level = ?', params[:level]).
          where(:remotable => true).joins(:language).where('users.id != ?', @current_user.id).page(params[:page].to_i).per_page(params[:per_page].to_i)
      end
    end
  end

  def make_remotable
    @current_user.remotable = true
    @current_user.save
    #redirects using the pair language and pair level parameters passed
    #through the hidden fields
    redirect_to "/coder_search?language=#{params[:language]}&level=#{params[:level]}&remotable=true"
  end
end

