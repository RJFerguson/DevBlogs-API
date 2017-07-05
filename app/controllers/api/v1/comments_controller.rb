class Api::V1::CommentsController < ApplicationController
  def index
    commentable = (Post.find(params[:commentable_id]) || Comment.find(params[:commentable_id]))
    comments = commentable.comments
    render json: comments 
  end

  def show 

  end 
  #what is this doing?
  def new
    comment = commentable.comments.new
  end

  def create
      comment = commentable.comments.new(allowed_params)  
      comment.save
  end
end 
