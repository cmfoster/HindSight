class UsersController < ApplicationController
  before_filter :authenticate_user, :only => [:edit]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @postlist = @user.posts.all(:order => "created_at DESC", :limit => 10)
    subfind = Array.new
    @posts.each do |p|
      p.hinds.each do |h|
	subfind << h if h.subject?
      end
    end    
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
      @userposts = @user.posts.order('posts.created_at DESC')
      respond_to do |format|
	format.js {@userposts}
      end
    end
  end
  
end
