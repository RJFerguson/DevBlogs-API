class Api::V1::CommentsController < ApplicationController
 before_action :find_commentable


  def index
    commentable = (Post.find(params[:commentable_id]) || Comment.find(params[:commentable_id]))
    comments = commentable.comments
    render json: comments 
  end


  def new
    # @comment = @commentable.comments.new

    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    if params.include?([:post_id])
      parent = Post.find_by_id(params[:post_id])
      @comment = parent.comments.create(comment_params)
    else
      @comment = Comment.new(comment_params)
    end
    # @comment = @commentable.comments.new(allowed_params)  
     @comment.save 
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
  end

end