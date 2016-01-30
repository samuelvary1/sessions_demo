class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	!!current_user
  end

  def authenticate
    if session[:user_id].nil?      
    redirect_to :controller => "sessions", :action => "create"
    flash[:notice] = "You must log in to view articles!"
    end
  end
end