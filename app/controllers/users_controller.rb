class UsersController < ApplicationController
	def index
	end

	def new
	end

	def show
    	@user = User.find(params[:id])
  	end

	def create
  		@user = User.new(user_params)
  		if @user.save 
  			session[:user_id] = @user.id
  			redirect_to @user
  		else
  			redirect_to root_path
  		end
	end

	private
  		def user_params
    		params.require(:user).permit(:username, :password)
  		end
end
