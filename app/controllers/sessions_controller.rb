class SessionsController < ApplicationController

  skip_before_filter :authorize

  def new
  end

  def create
      if user = User.authenticate(params[:username], params[:password])
          session[:user_id] = user.id
          dest = session[:pre_login_req_uri]
          if dest
            redirect_to dest
          else
            redirect_to root_url
          end
      else
          redirect_to login_url, :alert => "Invalid user/password combination"
      end
  end

  def reset_selection
      session[:user_location] = nil 
      session[:user_dish] = nil 
      redirect_to find_url, :notice => "Session Reset"
  end

  def destroy
      session[:user_id] = nil 
      redirect_to find_url, :notice => "Logged out"
  end

end
