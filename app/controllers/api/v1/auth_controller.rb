class Api::V1::AuthController < ApplicationController
  before_action :authorize_user!, only: [:show]

  def show
    render json: {
        id: current_user.id,
        username: current_user.username
       }
  end

  def create
    user = User.find_by(username: params[:username])
    if user.present? && user.authenticate(params[:password])
       render json: {
        id: user.id,
        username: user.username,
        jwt: JWT.encode({user_id: user.id}, ENV['JWT_SECRET'], ENV['JWT_ALGO'])
       }
     else
       render json: {
        error: 'Username or password incorrect'
      }, status: 404
    end
  end

  def createOauth
    user = User.find_or_create_from_auth_hash(auth_hash)
    render json: {
        id: user.id,
        username: user.username,
        jwt: JWT.encode({user_id: user.id}, ENV['JWT_SECRET'], ENV['JWT_ALGO'])
       }
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end