class GroupsController < ApplicationController

	def index
		@groups = Group.all
		render :'groups/index'
	end

	def show
		@group = Group.find(params[:id])
		@users = @group.users
		render :'groups/show'
	end


	def update
		@group = Group.find(params[:group_id])
		@user = User.find(params[:id])
		@group.users << @user
	end



	
end
