class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user

  def authenticate_user
    return session.delete(:current_user) unless current_user_id
    @current_user ||= (session[:current_user] = Hull.get(current_user_id))
    @github_user  ||= @current_user['identities'].select { |i| i['provider'] == 'github' }.first
  end

  def current_user_id
    @current_user_id ||= Hull.authenticate_user(request.env)
  end

end
