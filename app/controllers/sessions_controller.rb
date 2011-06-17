class SessionsController < ApplicationController

	def create
		user = User.authenticate(params[:session][:username], params[:session][:password])
		
		if user.nil?
			flash[:error] = "Invalid username/password combination"
			redirect_back_or :root
		else
			sign_in user
			flash[:success] = "You have been logged in"
			redirect_back_or :root
		end
	end
	
	def destroy
		flash[:success] = "You are now logged out"
		sign_out
		redirect_back_or :root
	end

end
