class UsersController < ApplicationController
  before_filter :authenticate_user, :only => [:edit]
  respond_to :html, :js, :json
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @postlist = @user.posts.all(:order => "created_at DESC", :limit => 10)
    subfind = Array.new
    @posts.each do |p|
      p.tags.each do |h|
	subfind << h if h.subject?
      end
    end    
    @user.about = "User has not filled this out" if @user.about && @user.about.length < 50
    @subjects = subfind.last(5)
    respond_to do |format|
      format.html
      format.js
    end
  end
    
  def edit
    @user = current_user if current_user
  end

  def userposts
    if params[:user_id].present? # use this method to add a fallback if something goes wrong
      @user = User.find(params[:user_id])
      @userposts = @user.posts.order('posts.created_at ASC').page(params[:page]).per(10)
      respond_with @userposts
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_with @user
  end
  
end
