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
  end

  def show
  end

  def edit
  end

end
