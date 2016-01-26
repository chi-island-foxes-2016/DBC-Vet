class UsersController < ApplicationController

  def new
  end

  def create
    @user  = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to documents_path
    else
      redirect_to signup_path
    end
  end
  #this is required by rails 4
  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
