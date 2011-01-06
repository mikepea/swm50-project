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
            redirect_to users_url
          end
      else
          redirect_to login_url, :alert => "Invalid user/password combination"
      end
  end

  def destroy
      session[:user_id] = nil 
      redirect_to locations_url, :notice => "Logged out"
  end

end
