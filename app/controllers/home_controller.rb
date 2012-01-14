class HomeController < ApplicationController
 
  def index
    @user = current_user if current_user
    @posts = Post.find(:all, :order => "created_at DESC", :limit => 10) 
    
  end

end
