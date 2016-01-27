class AdminController < ApplicationController
  include AdminHelper

	def index
    if session[:user_id] && admin?
		  render :'admin/index'
    else
      redirect_to login_path
    end
	end

end
