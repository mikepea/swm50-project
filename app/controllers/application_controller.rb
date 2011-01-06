class ApplicationController < ActionController::Base

  before_filter :authorize
  protect_from_forgery

  private

    # Who is logged in?
    def current_user
      User.find(session[:user_id])
    end

    # Where is the person? 
    def current_location
      current_user_location.location
    end
 
    # Where is the person? 
    def current_user_location
      UserLocation.find(session[:user_location_id])
    rescue ActiveRecord::RecordNotFound 
      user_location = UserLocation.create 
      session[:user_location_id] = user_location.id 
      user_location
    end

  protected
    def authorize 
      user = User.find_by_id(session[:user_id])
      if user
        @display_user = user.username
      else 
        session[:pre_login_req_uri] = request.env['REQUEST_URI'] 
        redirect_to login_url, :notice => "You need to log in to access this page."
      end 
    end

end
