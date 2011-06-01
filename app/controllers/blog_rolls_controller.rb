class BlogRollsController < ApplicationController

before_filter :authenticate, :except => :index

  def index
    @title = "| Blogroll"
  	@nav_current = "blogroll"
  	@blogroll_categories = BlogrollCategory.all
  end  
  
  def new
  	@title = "| New Blogroll item"
  	@blogroll = BlogRoll.new
  	@blogroll_categories = BlogrollCategory.all
  end

  def create
  	@blogroll = BlogRoll.new(params[:blog_roll])
  	if @blogroll.save
  		flash[:success] = "Blogroll added!"
  		redirect_to blog_rolls_path
  	else
  		@blogroll_categories = BlogrollCategory.all
  		@title = "| New Blogroll item"
  		render 'new'
  	end
  end

  def edit
  	@blogroll = BlogRoll.find(params[:id])
  	@blogroll_categories = BlogrollCategory.all
  	@title = "| Edit Blogroll Item"
  end

  def update
  	@blogroll = BlogRoll.find(params[:id])
  	if @blogroll.update_attributes(params[:blog_roll])
  		flash[:success] = "Update successful"
  		redirect_to blog_rolls_path
  	else
  		@title = "| Edit Blogroll Item"
  		render 'edit'
  	end
  end
  
  def destroy
  	blogroll = BlogRoll.find(params[:id])
  	blogroll.delete
  	redirect_to blog_rolls_path
  end
end
