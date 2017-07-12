class Api::V1::SessionController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    render :json => auth_hash.inspect
  end

  def failure
  end
end
