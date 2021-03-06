class UsersController < ApplicationController
  include AdminHelper

  def new
    if !admin?
      redirect_to login_path
    end
  end

  def create
    @user  = User.new(user_params)
    @user.groups << Group.find(params[:group_id])
    if @user.save
      session[:user_id] = @user.id
      redirect_to documents_path
    else
      redirect_to signup_path
    end
  end

  def edit
    if admin?
      @user = User.find(params[:id])
      render :'users/edit'
    else
      redirect_to login_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to group_path(@user.groups[0].id)
    else
      redirect_to edit_path
    end
  end
  #this is required by rails 4
  private

  def group_params
    params.require(:group).permit(:group_id)
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :admin)
  end
end
