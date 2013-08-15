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
    if arbiter.process
      arbiter.send_notification_mailer
      redirect_to arbiter.search
    else
      flash[:notice] = "This is here just for our if statement in the form that makes the zipcode input red. Must remove later."
      redirect_to root_path
    end
  end

  # alt is our root
  def alt
    @json = User.all.to_gmaps4rails
  end

end

