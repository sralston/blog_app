class PostsController < ApplicationController

before_filter :authenticate_post_permissions, :except => [:index, :show, :tag_index ]

  def index
    @title = "| Home Page & Blog"
  	@nav_current = "home"
  	store_location
  	@posts = Post.where(:published => true)
  end
  
  def tag_index
  	@tag = Tag.find(params[:id])
  	@title = "| Posts tagged with " + @tag.name
  	@nav_current = "home"
  	store_location
  	@posts = @tag.posts.where(:published => true)
  	render 'index'
  end
  
  def new
  	@post = Post.new
  	@tags = Tag.all
  	@title = "| Create a new blog post"
  end

  def update
  	@post = Post.find(params[:id])
  	
  	if params[:post][:tag_ids].nil?
  		@post.tags.clear
  	else
	  	@new_tags = Tag.find(params[:post][:tag_ids])
	  	if @post.tags != @new_tags
	  		@post.tags.clear
	  		@post.tags << @new_tags
	  	end
  	end
  	
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
  	
  	if !params[:post][:tag_ids].nil?
  		@tags = Tag.find(params[:post][:tag_ids])
  		@post.tags << @tags
  	end
  	
  	if @post.save
  		flash[:success] = "Post saved -- Not yet published"
  		redirect_to preview_path(@post)
  	else
  		@title = "| Create a new blog post"
  		@tags = Tag.all
  		render 'new'
  	end
  end

  def show
  	store_location
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  	@tags = Tag.all
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
  
  def destroy
	post = Post.find(params[:id])
	post.tags.clear
	post.delete
	redirect_to unpublished_path
  end

end
