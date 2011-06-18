class TagsController < ApplicationController

before_filter :authenticate_post_permissions

  def create
 	@tag = Tag.new(params[:tag])
 	if @tag.save
 		respond_to do |format|
 			format.html { redirect_to(new_post_path) }
 			format.js
 		end
 	else
 		respond_to do |format|
 			format.html { render :controller => 'post', :action => 'new' }
 			format.js 	{ render :action => 'failure' }
 		end
 	end
  end
  
  def edit
  	@tag = Tag.find(params[:id])
  	respond_to do |format|
  		format.js
  	end
  end
  
  def update
  	@tag = Tag.find(params[:id])
  	
  	if @tag.update_attributes(params[:tag])
  		respond_to do |format|
  			format.js
  		end
  	else
  		respond_to do |format|
  			format.js	{ render :action => 'failure' }
  		end
  	end
  end
  
end
