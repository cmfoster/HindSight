class CommentsController < ApplicationController
  respond_to :html, :js
  
  def create
    @comment = Comment.create(params[:comment])
    @comment.post_id = params[:post_id]
    @comment.save!
    respond_with @comment
  end
end
