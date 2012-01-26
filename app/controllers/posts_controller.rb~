class PostsController < ApplicationController
  respond_to :html, :js
  autosuggest :tag, :subject
  
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    @comments = @post.comments
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
    #accepting params[:post] has issues with the :set_tags params 
    #so this had to be split up
    @post = Post.new 
    @post.title = params[:post][:title]
    @post.story = params[:post][:story]
    @post.user_id = current_user.id
    @post.solution = params[:post][:solution]
    @post.author = current_user.name
    #This statement accepts the new and current tags
    #then splits them into sperate values and adds || creates them
    if params[:post][:set_tags]  
      tags = params[:post][:set_tags].split(',')
      tags.each do |tag|
	if Tag.find_by_id(tag)
	  @post.tags << Tag.find_by_id(tag)
	else
	  tag = @post.tags.new(:subject => tag)
	  tag.save!
	end
      end
    end
    if params[:post][:new_tags]
	tag = @post.tags.new(:subject => params[:post][:new_tags])
	tag.save!
    end
    @post.save!
    respond_to do |format|
      format.html {redirect_to root_path }
      format.js
    end
  end

end
