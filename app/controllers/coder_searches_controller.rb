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

    # if @results
      @json = @results.to_gmaps4rails
    # elsif @remotable_results
      @json2 = @remotable_results.to_gmaps4rails
    # end
  end

  def make_remotable
    @current_user.remotable = true
    @current_user.save

    # If there is another coder with same language and level as me, send my info to them

    User.joins(:language).where(:notify => true).each do |user|
      # If user in database (Matt) with notable => true has same language/level as @current_user, Matt will be notified of @current_user
      if user != @current_user # This is to prevent youself from getting an email notification
        if @current_user.language_id == user.language_id && @current_user.level == user.level
          @recipient = user
          @new_buddy = @current_user
          @new_buddy_language = @current_user.language.language
          Notifications.delay.remotable_notify(@recipient, @new_buddy, @new_buddy_language)
        end
      end
    end

    #redirects using the pair language and pair level parameters passed
    #through the hidden fields
    redirect_to "/coder_search?language=#{params[:language]}&level=#{params[:level]}&remotable=true"
  end

  def remote_pair_notification
    @current_user.notify = true
    @current_user.save
  end
end

