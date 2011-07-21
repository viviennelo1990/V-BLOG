class CommentsController < ApplicationController
  before_filter :authenticate, :only => [:destroy]
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    if !@comment.save
      flash[:error] = "The comment was not saved."
    end
    redirect_to post_path(@post)
   
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
