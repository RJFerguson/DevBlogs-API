class Api::V1::PostsController < ApplicationController

  def index 
    posts = Post.order(pubdate: :desc)
    
    paginate json: posts, per_page: 30
    
  end 

  def show
    post = Post.find(params[:id])
    render json: post
  end


end
