class SessionsController < ApplicationController
	def new
	end

	def create
		  @user = User.find_by_username(params[:session][:username])
		  p @user
  			if @user && @user.authenticate(params[:session][:password])
  				session[:user_id] = @user.id
  				redirect_to articles_path
  			else
    			redirect_to root_path
  			end
	end

	def destroy
		session.clear
		redirect_to root_path
	end

end