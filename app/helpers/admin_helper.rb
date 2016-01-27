module AdminHelper
 #add before_filter :authorize to any controller if you want to make sure a authorized user can view that page
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/login' unless current_user
  end

  # check if user is admin
  def admin?
    if session[:user_id]
      User.find(session[:user_id]).admin
    else
      false
    end
  end

  # t/f is logged in
  def session?
   return true if session[:user_id]
  end

  # get user
  def user
    if session?
      User.find(session[:user_id])
    end
  end

end
