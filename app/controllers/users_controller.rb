class UsersController < ApplicationController
  include GroupsHelper

  def new
  end

  def create
    @user  = User.new(user_params)
    @group = @user.groups.new(group_type: group_type(group_params)) # calls groups helper method
    if @user.save && @group.save
      session[:user_id] = @user.id
      redirect_to documents_path
    else
      redirect_to signup_path
    end
  end

  def edit
    @user = User.find(params[:id])
    render :'users/edit'
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
    params.require(:group).permit(:group_type)
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :admin, :group_type)
  end
end
