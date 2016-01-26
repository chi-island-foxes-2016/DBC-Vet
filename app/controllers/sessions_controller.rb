class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to documents_path
    else
      redirect_to login_path
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to login_path
  end

end
