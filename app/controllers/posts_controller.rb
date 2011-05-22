class PostsController < ApplicationController

  def index
    @title = "| Home Page & Blog"
  	@nav_current = "home"
  	@posts = Post.all
  end
  
  def new
  	@post = Post.new
  	@title = "| Create a new blog post"
  end

  def update
  end

  def create
  	@post = Post.new(params[:post])
  	@post.posted_by = 1.to_i
  	if @post.save
  		flash[:success] = "Post saved!"
  		redirect_to :root
  	else
  		@title = "| Create a new blog post"
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end
  
  def preview
  end

end
