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
end
