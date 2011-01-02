class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  protected
    def authorize 
      user = User.find_by_id(session[:user_id])
      if user
        @display_user = user.username
      else 
        redirect_to login_url, :notice => "Please log in"
      end 
    end

end
