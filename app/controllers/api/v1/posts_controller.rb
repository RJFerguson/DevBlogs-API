class Api::V1::PostsController < ApplicationController

  def index 
    posts = Post.order(pubdate: :desc)
    
    paginate json: posts, per_page: 30
    
  end 

  def show
    post = Post.find(params[:id])
    render json: post
  end


  def search
    term = params[:term] || nil
    posts = []
    posts = Post.where('title LIKE ? '\
    'OR company LIKE ? '\
    'OR cast(pubdate as text) LIKE ?', "%#{term}%", "%#{term}%", "%#{term}%").limit(30) if term
    render json: posts
  end

end
