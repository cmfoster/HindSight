class PostsController < ApplicationController
  def show
  end

  def edit
  end
  
  def create
    @post = Post.create(params[:post])
    @post.user_id = current_user.id
    @post.save!
    respond_to do |format|
      format.js
    end
  end

end
