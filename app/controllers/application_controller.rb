class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user_id, :authenticate_user
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def authenticate_user
    return session.delete(:current_user) unless current_user_id
    if !session[:current_user] || session[:current_user]['id'] != current_user_id
      @current_user = session[:current_user] = User.from_hull_user(current_user_id)
    else
      @current_user = session[:current_user]
    end
  end

  def current_user_id
    @current_user_id ||= Hull.authenticate_user(request.env)
  end

  private

  def record_not_found
    render "public/404.html.erb", status: 404
  end
end
