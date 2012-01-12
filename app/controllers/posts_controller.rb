class PostsController < ApplicationController
  def show
  end

  def edit
  end
  
  def create
    @post = Post.create(params[:post])
    @post.user_id = current_user.id
    @post.save!
    redirect_to root_path
  end

end
