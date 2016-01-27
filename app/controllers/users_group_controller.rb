class UsersGroupController < ApplicationController

	def new
		# @group = Group.find(params[:group_id])
		 @users_group = UsersGroup.new(group_id: params[:group_id])
		render :'users_group/new'
	end

	def create
		@group = Group.find(params[:group_id])
		@user = User.find(params[:users_group][:user_id])
		if @group.users.include?(@user)
			flash[:notice] = "This user already exist"
			redirect_to group_path(@group)
		else
			@add_user = @group.users_groups.build(user: @user)
			if @add_user.save
				redirect_to group_path(@group)
			else
				render :'users_group/new'
			end
		end
	end

	private

	def group_params
		params.require(:user).permit(:username)
	end

end
