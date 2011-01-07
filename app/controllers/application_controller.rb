class ApplicationController < ActionController::Base

  before_filter :current_user
  before_filter :current_location
  before_filter :current_dish
  before_filter :authorize

  protect_from_forgery

  private

    # Who is logged in?
    def current_user
      if session[:user_id]
        @current_user = User.find(session[:user_id])
        @display_user = @current_user.name
      end
    end

    # Where is the person?
    def current_location
      if session[:user_location]
        @current_location = Location.find(session[:user_location])
        @display_location = @current_location.name
      end
    end

    # What do they intend to eat/review?
    def current_dish
      if session[:user_dish]
        @current_dish = Dish.find(session[:user_dish])
        @display_dish = @current_dish.name
      end
    end

  protected
    def authorize
      user = User.find_by_id(session[:user_id])
      unless user
        session[:pre_login_req_uri] = request.env['REQUEST_URI']
        redirect_to login_url, :notice => "You need to log in to access this page."
      end
    end

end
