class HomeController < ApplicationController
 respond_to :js, :html
 
  def index
    @user = current_user if current_user
    @posts = Post.order("created_at DESC").page(params[:page]).per(10)
    @taglist = Tag.used.clone #This is a Hash with keys(tags) ordered from most used to least
    @tags = Tag.order("LOWER(subject)").group("subject").page(params[:page]).per(20)

    respond_with @posts
  end

  def popularposts
    #Change this when you add in voting
    @posts = Post.order("title").page(params[:page]).per(10)
    respond_with @posts
  end
  
end
