class Api::V1::UsersController < ApplicationController

  def index 
    users = Users.all
    render json: users
    
  end
    
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
  
  def show
    user = User.find(params[:id])
    render json: user
  end


end 