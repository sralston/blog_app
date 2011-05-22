class PostsController < ApplicationController

  def index
    @title = "| Home Page & Blog"
  	@nav_current = "home"
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
			redirect_to "/preview/#{ @post.id }"
		end
	else
		@title = "| Edit post"
		render 'edit'
	end	
  end

  def create
  	@post = Post.new(params[:post])
  	@post.posted_by = 1.to_i
  	if @post.save
  		flash[:success] = "Post saved -- Not yet published"
  		redirect_to "/preview/#{ @post.id }"
  	else
  		@title = "| Create a new blog post"
  		render 'new'
  	end
  end

  def show
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
  		redirect_to "/preview/#{ @post.id }"
	end
  end
  
  def unpublished
  	@title = "| Unpublished posts"
  	@posts = Post.where(:published => false)
  end
  
  def delete
	post = Post.find(params[:id])
	post.delete
	redirect_to '/unpublished'
  end

end
