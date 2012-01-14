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
  end
    
  def edit
    @user = current_user if current_user
  end

end
