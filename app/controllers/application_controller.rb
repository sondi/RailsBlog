class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	  def current_user
  		if session[:user_id]
    			@current_user ||= User.find_by_id(session[:user_id])
  		end
  	end

  	def logged_in?
    	!current_user.nil?
  	end

    helper_method :current_user
    helper_method :logged_in?
end
