class GroupsController < ApplicationController

	def index
		@groups = Group.all
		render :'groups/index'
	end
end
