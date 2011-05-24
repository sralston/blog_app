class UsersController < ApplicationController
  def new
  	@user = User.new
  	@title = "| New User signup"
  end

  def update
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		sign_in @user
  		flash[:success] = "You are now signed up!"
  		redirect_back_or :root
  	else
  		@title = "| New User signup"
  		render 'new'
  	end
  end

end
