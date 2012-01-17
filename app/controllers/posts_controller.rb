class PostsController < ApplicationController
  respond_to :html, :js
  
  def show
    @post = Post.find(params[:id])
    if @post
      respond_with @post
    end
  end
  
  def new
    @post = Post.new
    respond_with @post
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post
      respond_to do |format|
	if @post.update_attributes(params[:post])
	  format.js 
	else
	  redirect_to root
	end
      end
    end
  end
  
  def create
    @post = Post.create(params[:post])
    @post.user_id = current_user.id
    @post.author = current_user.name
    @post.save
    respond_to do |format|
      format.html {redirect_to root_path }
      format.js
    end
  end
  
end
