class PostsController < ApplicationController

before_filter :authenticate, :except => [:index, :show ]

  def index
    @title = "| Home Page & Blog"
  	@nav_current = "home"
  	store_location
  	@posts = Post.where(:published => true)
  end
  
  def new
  	@post = Post.new
  	@title = "| Create a new blog post"
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update_attributes(params[:post])
		flash[:success] = "Post updated"
		if @post.published
			redirect_to post_path(@post)
		else
			redirect_to preview_path(@post)
		end
	else
		@title = "| Edit post"
		render 'edit'
	end	
  end

  def create
  	@post = current_user.posts.build(params[:post])
  	if @post.save
  		flash[:success] = "Post saved -- Not yet published"
  		redirect_to preview_path(@post)
  	else
  		@title = "| Create a new blog post"
  		render 'new'
  	end
  end

  def show
  	store_location
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  	@title = "| Edit post"
  end
  
  def preview
   	@post = Post.find(params[:id])
  end
  
  def publish
  	@post = Post.find(params[:id])
  	@post.created_at = Time.now
  	@post.published = true
  	if @post.save
  		flash[:success] = "Post published!"
  		redirect_to :root
  	else
  		redirect_to preview_path(@post)
	end
  end
  
  def unpublished
  	@title = "| Unpublished posts"
  	@posts = Post.where(:published => false)
  end
  
  def delete
	post = Post.find(params[:id])
	post.delete
	redirect_to unpublished_path
  end

end
